import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/medical-records/data/models/medical_record_model.dart';
import 'package:koder_animalts_app/features/medical-records/domain/entities/medical_records_entity.dart';
import 'package:koder_animalts_app/features/medical-records/domain/repositories/medical_records_repository.dart';

class MedicalRecordsRepositoryImpl implements MedicalRecordsRepository {
  final HttpClient _httpClient;

  MedicalRecordsRepositoryImpl(this._httpClient);

  @override
  Future<List<MedicalRecordsEntity>> findMedicalRecordsByVeterinarian(
    String veterinarianId,
  ) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/medical-record/veterinarian/$veterinarianId',
    );

    return response.fold(
      (failure) => throw failure,
      (list) => list
          .map(
            (json) => MedicalRecordModel.fromJson(json as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  @override
  Future<List<MedicalRecordsEntity>> findMedicalRecordsByPet(
    String petId,
  ) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/medical-record/pet/$petId',
    );

    return response.fold(
      (failure) => throw failure,
      (list) => list
          .map(
            (json) => MedicalRecordModel.fromJson(json as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
