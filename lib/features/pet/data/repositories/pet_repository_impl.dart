import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/pet/data/models/pet_model.dart';
import 'package:koder_animalts_app/features/pet/domain/entities/pet_entity.dart';
import 'package:koder_animalts_app/features/pet/domain/repositories/pet_repository.dart';

class PetRepositoryImpl implements PetRepository {
  final HttpClient _httpClient;

  PetRepositoryImpl(this._httpClient);

  @override
  Future<List<PetEntity>> findPetsByOwnerId(String ownerId) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/pet/owner/$ownerId',
    );

    return response.fold(
      (failure) => throw failure,
      (list) => list
          .map((json) => PetModel.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<List<PetEntity>> findPetsByVeterinarianId(
    String veterinarianId,
  ) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/pet/veterinarian/$veterinarianId',
    );

    return response.fold(
      (failure) => throw failure,
      (list) => list
          .map((json) => PetModel.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }
}
