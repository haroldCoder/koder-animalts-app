import 'package:json_annotation/json_annotation.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/domain/entities/veterinary_clinic.dart';

part 'veterinary_clinic_model.g.dart';

@JsonSerializable()
class VeterinaryClinicModel extends VeterinaryClinic {
  const VeterinaryClinicModel({
    required super.id,
    required super.name,
    required super.address,
    required super.phone,
    required super.email,
  });

  factory VeterinaryClinicModel.fromJson(Map<String, dynamic> json) =>
      _$VeterinaryClinicModelFromJson(json);

  Map<String, dynamic> toJson() => _$VeterinaryClinicModelToJson(this);

  factory VeterinaryClinicModel.fromEntity(VeterinaryClinic entity) {
    return VeterinaryClinicModel(
      id: entity.id,
      name: entity.name,
      address: entity.address,
      phone: entity.phone,
      email: entity.email,
    );
  }
}
