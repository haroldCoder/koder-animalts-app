import 'dart:async';
import 'package:koder_animalts_app/core/providers/http_client_provider.dart';
import 'package:koder_animalts_app/features/owner/data/models/create_owner_dto.dart';
import 'package:koder_animalts_app/features/owner/data/repositories/owner_repository_impl.dart';
import 'package:koder_animalts_app/features/owner/domain/entities/owner.dart';
import 'package:koder_animalts_app/features/owner/domain/repositories/owner_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'owner_provider.g.dart';

@riverpod
OwnerRepository ownerRepository(Ref ref) =>
    OwnerRepositoryImpl(ref.watch(httpClientProvider));

@riverpod
class OwnerNotifier extends _$OwnerNotifier {
  @override
  FutureOr<Owner?> build() {
    return null;
  }

  Future<void> createOwner(CreateOwnerDto dto) async {
    state = const AsyncValue.loading();
    final repository = ref.read(ownerRepositoryProvider);
    final result = await repository.createOwner(dto);

    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (owner) => state = AsyncValue.data(owner),
    );
  }
}
