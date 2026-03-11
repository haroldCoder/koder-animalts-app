import 'package:koder_animalts_app/core/providers/http_client_provider.dart';
import 'package:koder_animalts_app/features/pet/data/repositories/pet_repository_impl.dart';
import 'package:koder_animalts_app/features/pet/domain/entities/pet_entity.dart';
import 'package:koder_animalts_app/features/pet/domain/repositories/pet_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pet_provider.g.dart';

@riverpod
PetRepository petRepository(Ref ref) {
  return PetRepositoryImpl(ref.watch(httpClientProvider));
}

@riverpod
Future<List<PetEntity>> getPetsByOwnerId(Ref ref, String id) {
  return ref.watch(petRepositoryProvider).findPetsByOwnerId(id);
}

@riverpod
Future<List<PetEntity>> getPetsByVeterinarianId(Ref ref, String id) {
  return ref.watch(petRepositoryProvider).findPetsByVeterinarianId(id);
}
