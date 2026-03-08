import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:koder_animalts_app/features/assign_role/domain/entities/user_role.dart';

part 'role_provider.g.dart';

@riverpod
class SelectedRole extends _$SelectedRole {
  @override
  UserRole build() {
    return UserRole.uusuario;
  }

  void setRole(UserRole role) {
    state = role;
  }
}
