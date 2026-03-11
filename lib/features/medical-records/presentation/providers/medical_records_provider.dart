import 'package:koder_animalts_app/core/providers/http_client_provider.dart';
import 'package:koder_animalts_app/features/medical-records/data/repositories/medical_records_repository_impl.dart';
import 'package:koder_animalts_app/features/medical-records/domain/entities/medical_records_entity.dart';
import 'package:koder_animalts_app/features/medical-records/domain/repositories/medical_records_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medical_records_provider.g.dart';

@riverpod
MedicalRecordsRepository medicalRecordsRepository(Ref ref) {
  return MedicalRecordsRepositoryImpl(ref.watch(httpClientProvider));
}

@riverpod
Future<List<MedicalRecordsEntity>> getMedicalRecordsByVeterinarian(
  Ref ref,
  String id,
) {
  return ref
      .watch(medicalRecordsRepositoryProvider)
      .findMedicalRecordsByVeterinarian(id);
}

@riverpod
Future<List<MedicalRecordsEntity>> getMedicalRecordsByPet(Ref ref, String id) {
  return ref
      .watch(medicalRecordsRepositoryProvider)
      .findMedicalRecordsByPet(id);
}
