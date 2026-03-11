import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:koder_animalts_app/features/assign_role/domain/entities/user_role.dart';

part 'role_provider.g.dart';

class RoleState {
  final UserRole role;
  final String contact;
  final String address;
  final String specialty;
  final String clinicId;

  RoleState({
    required this.role,
    this.contact = '',
    this.address = '',
    this.specialty = '',
    this.clinicId = '',
  });

  RoleState copyWith({
    UserRole? role,
    String? contact,
    String? address,
    String? specialty,
    String? clinicId,
  }) {
    return RoleState(
      role: role ?? this.role,
      contact: contact ?? this.contact,
      address: address ?? this.address,
      specialty: specialty ?? this.specialty,
      clinicId: clinicId ?? this.clinicId,
    );
  }
}

@riverpod
class SelectedRole extends _$SelectedRole {
  @override
  RoleState build() {
    return RoleState(role: UserRole.OWNER);
  }

  void setRole(UserRole role) {
    state = state.copyWith(role: role);
  }

  void setContact(String contact) {
    state = state.copyWith(contact: contact);
  }

  void setAddress(String address) {
    state = state.copyWith(address: address);
  }

  void setSpecialty(String specialty) {
    state = state.copyWith(specialty: specialty);
  }

  void setClinicId(String clinicId) {
    state = state.copyWith(clinicId: clinicId);
  }
}
