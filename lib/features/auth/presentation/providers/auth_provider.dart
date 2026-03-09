import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:koder_animalts_app/core/providers/http_client_provider.dart';
import 'package:koder_animalts_app/features/auth/infrastructure/services/google_user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:koder_animalts_app/features/auth/data/models/authenticate_params_dto.dart';
import 'package:koder_animalts_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:koder_animalts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:koder_animalts_app/features/auth/infrastructure/services/google_sign_in_service.dart';

part 'auth_provider.g.dart';

@riverpod
GoogleSignInService googleSignInService(Ref ref) => GoogleSignInService();

@riverpod
GoogleUserService googleUserService(Ref ref) => GoogleUserService();

@riverpod
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(httpClientProvider);
  return AuthRepositoryImpl(client);
}

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  StreamSubscription<User?>? _authStateSubscription;

  @override
  FutureOr<Map<String, dynamic>?> build() async {
    // Escuchar cambios de estado en Firebase Auth
    _authStateSubscription?.cancel();
    _authStateSubscription = FirebaseAuth.instance.authStateChanges().listen((
      User? user,
    ) {
      if (user != null) {
        state = AsyncValue.data({
          'email': user.email,
          'displayName': user.displayName,
          'photoUrl': user.photoURL,
          'uid': user.uid,
        });
      } else {
        state = const AsyncValue.data(null);
      }
    });

    ref.onDispose(() {
      _authStateSubscription?.cancel();
    });

    // El estado inicial será nulo o el usuario actual si ya existe
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return {
        'email': currentUser.email,
        'displayName': currentUser.displayName,
        'photoUrl': currentUser.photoURL,
        'uid': currentUser.uid,
      };
    }

    return null;
  }

  bool isUserLogged() {
    final googleService = ref.read(googleUserServiceProvider);
    return googleService.isUserLogged();
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.loading();

    final googleService = ref.read(googleSignInServiceProvider);
    final userCredential = await googleService.signIn();

    if (userCredential == null || userCredential.user == null) {
      state = const AsyncValue.data(null);
      return;
    }

    final user = userCredential.user!;
    final idToken = await user.getIdToken();

    final params = AuthenticateParamsDto(
      email: user.email ?? '',
      name: user.displayName,
      image: user.photoURL,
      providerId: 'google',
      accountId: user.uid,
      accessToken: idToken,
      idToken: idToken,
    );

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.authenticate(params);

    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (data) {
        state = AsyncValue.data({...data});
      },
    );
  }

  Future<void> logOut() async {
    state = const AsyncValue.loading();
    final googleService = ref.read(googleSignInServiceProvider);
    await googleService.signOut();
    state = const AsyncValue.data(null);
  }
}

// Extension to AuthenticateParamsDto to include idToken if needed, 
// but wait, I should update the model first if I want to be consistent. 
// For now I will use what the user provided.
