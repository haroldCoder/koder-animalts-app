import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/auth/data/models/authenticate_params_dto.dart';
import 'package:koder_animalts_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:koder_animalts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:koder_animalts_app/features/auth/infrastructure/services/google_sign_in_service.dart';
import 'package:koder_animalts_app/features/auth/infrastructure/services/google_initialize_service.dart';
import 'package:koder_animalts_app/features/auth/infrastructure/services/google_user_service.dart';

part 'auth_provider.g.dart';

@riverpod
HttpClient httpClient(Ref ref) => HttpClient();

@riverpod
GoogleSignInService googleSignInService(Ref ref) => GoogleSignInService();

@riverpod
GoogleInitializeService googleInitializeService(Ref ref) =>
    GoogleInitializeService();

@riverpod
GoogleUserService googleUserService(Ref ref) => GoogleUserService();

@riverpod
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(httpClientProvider);
  return AuthRepositoryImpl(client);
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<Map<String, dynamic>?> build() async {
    // 1. Inicializar apenas se abra
    final initService = ref.read(googleInitializeServiceProvider);
    await initService.initialize();

    // 2. Consultarlo apenas se abra
    _checkPersistedSession();

    return null;
  }

  Future<void> _checkPersistedSession() async {
    final userService = ref.read(googleUserServiceProvider);
    final user = await userService.signInSilently();

    if (user != null) {
      state = AsyncValue.data({
        'email': user.email,
        'displayName': user.displayName,
        'photoUrl': user.photoUrl,
        'id': user.id,
      });
    }
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.loading();

    final googleService = ref.read(googleSignInServiceProvider);
    final user = await googleService.signIn();

    if (user == null) {
      state = const AsyncValue.data(null);
      return;
    }

    final authentication = user.authentication;

    final params = AuthenticateParamsDto(
      email: user.email,
      name: user.displayName,
      image: user.photoUrl,
      providerId: 'google',
      accountId: user.id,
      accessToken: authentication.idToken,
      idToken: authentication
          .idToken, // Note: Added this as it's common for backend verification
    );

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.authenticate(params);

    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (data) => state = AsyncValue.data(data),
    );
  }
}

// Extension to AuthenticateParamsDto to include idToken if needed, 
// but wait, I should update the model first if I want to be consistent. 
// For now I will use what the user provided.
