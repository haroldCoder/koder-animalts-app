import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

enum RoleEnum {
  @JsonValue('OWNER')
  OWNER,
  @JsonValue('VETERINARIAN')
  VETERINARIAN,
  @JsonValue('UNKNOWN')
  UNKNOWN,
}

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String image;
  final RoleEnum role;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.image,
    required this.role,
  });

  @override
  List<Object?> get props => [id, email, name, image, role];
}
