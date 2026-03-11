import 'package:koder_animalts_app/features/medical-records/domain/entities/medical_records_entity.dart';

abstract class MedicalRecordsRepository {
  Future<List<MedicalRecordsEntity>> findMedicalRecordsByVeterinarian(
    String veterinarianId,
  );
  Future<List<MedicalRecordsEntity>> findMedicalRecordsByPet(String petId);
}
