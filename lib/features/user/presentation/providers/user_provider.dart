import 'dart:async';
import 'package:koder_animalts_app/features/user/domain/entities/user.dart';
import 'package:koder_animalts_app/core/providers/http_client_provider.dart';
import 'package:koder_animalts_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:koder_animalts_app/features/user/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) =>
    UserRepositoryImpl(ref.watch(httpClientProvider));

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<void> getUser(String idUser) async {
    state = const AsyncValue.loading();
    final repository = ref.read(userRepositoryProvider);
    final result = await repository.getUser(idUser);

    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }
}
