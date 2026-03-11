import 'package:koder_animalts_app/features/pet/domain/entities/pet_entity.dart';

class PetModel extends PetEntity {
  const PetModel({
    required super.id,
    required super.name,
    required super.species,
    super.breed,
    required super.gender,
    super.birthDate,
    super.weight,
    required super.mainImage,
    required super.ownerId,
    required super.clinicId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'] as String,
      name: json['name'] as String,
      species: json['species'] as String,
      breed: json['breed'] as String?,
      gender: GenderPet.values.firstWhere(
        (e) => e.toString().split('.').last == json['gender'],
        orElse: () => GenderPet.MALE,
      ),
      birthDate: json['birthDate'] != null
          ? DateTime.parse(json['birthDate'] as String)
          : null,
      weight: (json['weight'] as num?)?.toDouble(),
      mainImage: json['mainImage'] as String,
      ownerId: json['ownerId'] as String,
      clinicId: json['clinicId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'species': species,
      'breed': breed,
      'gender': gender.toString().split('.').last,
      'birthDate': birthDate?.toIso8601String(),
      'weight': weight,
      'mainImage': mainImage,
      'ownerId': ownerId,
      'clinicId': clinicId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
