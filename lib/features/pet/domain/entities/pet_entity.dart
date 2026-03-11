enum GenderPet { MALE, FEMALE }

class PetEntity {
  final String id;
  final String name;
  final String species;
  final String? breed;
  final GenderPet gender;
  final DateTime? birthDate;
  final double? weight;
  final String mainImage;
  final String ownerId;
  final String clinicId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PetEntity({
    required this.id,
    required this.name,
    required this.species,
    this.breed,
    required this.gender,
    this.birthDate,
    this.weight,
    required this.mainImage,
    required this.ownerId,
    required this.clinicId,
    required this.createdAt,
    required this.updatedAt,
  });
}
