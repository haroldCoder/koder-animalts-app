import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/auth/data/models/authenticate_params_dto.dart';
import 'package:koder_animalts_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:koder_animalts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:koder_animalts_app/features/auth/infrastructure/services/google_sign_in_service.dart';

part 'auth_provider.g.dart';

@riverpod
HttpClient httpClient(Ref ref) => HttpClient();

@riverpod
GoogleSignInService googleSignInService(Ref ref) => GoogleSignInService();

@riverpod
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(httpClientProvider);
  return AuthRepositoryImpl(client);
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<Map<String, dynamic>?> build() {
    // Intentar recuperar sesión al iniciar (si el service lo permite)
    // _checkPersistedSession();
    return const AsyncValue.data(null);
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.loading();

    final googleService = ref.read(googleSignInServiceProvider);
    final user = await googleService.signIn();

    if (user == null) {
      state = const AsyncValue.data(null);
      return;
    }

    final authentication = await user.authentication;

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
