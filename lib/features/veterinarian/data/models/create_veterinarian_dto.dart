import 'package:json_annotation/json_annotation.dart';

part 'create_veterinarian_dto.g.dart';

@JsonSerializable()
class CreateVeterinarianDto {
  final String? specialty;
  final String phone;
  final String userId;
  final String clinicId;

  const CreateVeterinarianDto({
    this.specialty,
    required this.phone,
    required this.userId,
    required this.clinicId,
  });

  factory CreateVeterinarianDto.fromJson(Map<String, dynamic> json) =>
      _$CreateVeterinarianDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateVeterinarianDtoToJson(this);
}
