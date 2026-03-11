import 'package:koder_animalts_app/features/pet/domain/entities/pet_entity.dart';

abstract class PetRepository {
  Future<List<PetEntity>> findPetsByOwnerId(String ownerId);
  Future<List<PetEntity>> findPetsByVeterinarianId(String veterinarianId);
}
