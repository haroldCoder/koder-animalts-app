import 'package:equatable/equatable.dart';

class VeterinaryClinic extends Equatable {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String email;

  const VeterinaryClinic({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, address, phone];
}
