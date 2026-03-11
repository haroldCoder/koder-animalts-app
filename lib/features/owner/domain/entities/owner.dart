import 'package:equatable/equatable.dart';

class Owner extends Equatable {
  final String id;
  final String address;
  final String phone;
  final String userId;

  const Owner({
    required this.id,
    required this.address,
    required this.phone,
    required this.userId,
  });

  @override
  List<Object?> get props => [id, address, phone, userId];
}
