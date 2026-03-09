import 'package:equatable/equatable.dart';

class Veterinarian extends Equatable {
  final String id;
  final String? specialty;
  final String phone;
  final String userId;
  final String clinicId;

  const Veterinarian({
    required this.id,
    this.specialty,
    required this.phone,
    required this.userId,
    required this.clinicId,
  });

  @override
  List<Object?> get props => [id, specialty, phone, userId, clinicId];
}
