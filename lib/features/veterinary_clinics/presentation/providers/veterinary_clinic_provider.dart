import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:koder_animalts_app/core/providers/http_client_provider.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/domain/entities/veterinary_clinic.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/domain/repositories/veterinary_clinic_repository.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/data/repositories/veterinary_clinic_repository_impl.dart';

part 'veterinary_clinic_provider.g.dart';

@riverpod
VeterinaryClinicRepository veterinaryClinicRepository(Ref ref) {
  return VeterinaryClinicRepositoryImpl(ref.watch(httpClientProvider));
}

@riverpod
Future<List<VeterinaryClinic>> veterinaryClinics(Ref ref) async {
  final repository = ref.watch(veterinaryClinicRepositoryProvider);
  final result = await repository.getAllClinics();

  return result.fold((failure) => throw failure, (clinics) => clinics);
}
