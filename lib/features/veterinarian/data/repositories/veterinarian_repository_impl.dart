import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/veterinarian/data/models/create_veterinarian_dto.dart';
import 'package:koder_animalts_app/features/veterinarian/domain/entities/veterinarian.dart';
import 'package:koder_animalts_app/features/veterinarian/domain/repositories/veterinarian_repository.dart';

class VeterinarianRepositoryImpl implements VeterinarianRepository {
  final HttpClient _httpClient;

  VeterinarianRepositoryImpl(this._httpClient);

  @override
  Future<Either<Failure, Veterinarian>> createVeterinarian(
    CreateVeterinarianDto dto,
  ) async {
    final response = await _httpClient.post<Map<String, dynamic>>(
      '/veterinarian/create',
      data: dto.toJson(),
    );

    return response.fold((failure) => Left(failure), (json) {
      try {
        return Right(
          Veterinarian(
            id: json['id'] as String,
            specialty: json['specialty'] as String?,
            phone: json['phone'] as String,
            userId: json['userId'] as String,
            clinicId: json['clinicId'] as String,
          ),
        );
      } catch (e) {
        return Left(GenericFailure('Error parsing veterinarian data: $e'));
      }
    });
  }
}
