import 'package:json_annotation/json_annotation.dart';

part 'create_owner_dto.g.dart';

@JsonSerializable()
class CreateOwnerDto {
  final String address;
  final String phone;
  final String userId;

  const CreateOwnerDto({
    required this.address,
    required this.phone,
    required this.userId,
  });

  factory CreateOwnerDto.fromJson(Map<String, dynamic> json) =>
      _$CreateOwnerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOwnerDtoToJson(this);
}
