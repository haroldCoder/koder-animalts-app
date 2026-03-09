enum UserRole { OWNER, VETERINARIAN }

class UserRoleEntity {
  final UserRole role;

  UserRoleEntity({required this.role});

  String get displayName {
    switch (role) {
      case UserRole.OWNER:
        return 'Usuario';
      case UserRole.VETERINARIAN:
        return 'Veterinario';
    }
  }
}
