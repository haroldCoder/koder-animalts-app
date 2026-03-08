enum UserRole { uusuario, veterinario }

class UserRoleEntity {
  final UserRole role;

  UserRoleEntity({required this.role});

  String get displayName {
    switch (role) {
      case UserRole.uusuario:
        return 'Usuario';
      case UserRole.veterinario:
        return 'Veterinario';
    }
  }
}
