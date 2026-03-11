import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/data/models/veterinary_clinic_model.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/domain/entities/veterinary_clinic.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/domain/repositories/veterinary_clinic_repository.dart';

class VeterinaryClinicRepositoryImpl implements VeterinaryClinicRepository {
  final HttpClient _httpClient;

  VeterinaryClinicRepositoryImpl(this._httpClient);

  @override
  Future<Either<Failure, List<VeterinaryClinic>>> getAllClinics() async {
    final response = await _httpClient.get<Map<String, dynamic>>(
      '/veterinary-clinics/all',
    );

    return response.fold((failure) => Left(failure), (json) {
      try {
        // Accessing the 'data' key which contains the list
        final dynamic dataField = json['data'];
        if (dataField is! List) {
          return Left(
            GenericFailure(
              'Expected a list in "data" field, but got ${dataField.runtimeType}',
            ),
          );
        }

        final clinics = dataField
            .map(
              (item) =>
                  VeterinaryClinicModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        return Right(clinics);
      } catch (e) {
        return Left(GenericFailure('Error parsing veterinary clinics: $e'));
      }
    });
  }
}
