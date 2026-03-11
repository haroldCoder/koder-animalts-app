import 'dart:async';
import 'package:koder_animalts_app/core/providers/http_client_provider.dart';
import 'package:koder_animalts_app/features/veterinarian/data/models/create_veterinarian_dto.dart';
import 'package:koder_animalts_app/features/veterinarian/data/repositories/veterinarian_repository_impl.dart';
import 'package:koder_animalts_app/features/veterinarian/domain/entities/veterinarian.dart';
import 'package:koder_animalts_app/features/veterinarian/domain/repositories/veterinarian_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'veterinarian_provider.g.dart';

@riverpod
VeterinarianRepository veterinarianRepository(Ref ref) =>
    VeterinarianRepositoryImpl(ref.watch(httpClientProvider));

@riverpod
class VeterinarianNotifier extends _$VeterinarianNotifier {
  @override
  FutureOr<Veterinarian?> build() {
    return null;
  }

  Future<void> createVeterinarian(CreateVeterinarianDto dto) async {
    state = const AsyncValue.loading();
    final repository = ref.read(veterinarianRepositoryProvider);
    final result = await repository.createVeterinarian(dto);

    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (veterinarian) => state = AsyncValue.data(veterinarian),
    );
  }
}
