import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/owner/data/models/create_owner_dto.dart';
import 'package:koder_animalts_app/features/owner/domain/entities/owner.dart';
import 'package:koder_animalts_app/features/owner/domain/repositories/owner_repository.dart';

class OwnerRepositoryImpl implements OwnerRepository {
  final HttpClient _httpClient;

  OwnerRepositoryImpl(this._httpClient);

  @override
  Future<Either<Failure, Owner>> createOwner(CreateOwnerDto dto) async {
    final response = await _httpClient.post<Map<String, dynamic>>(
      '/owner/create',
      data: dto.toJson(),
    );

    return response.fold((failure) => Left(failure), (json) {
      try {
        // Assuming the API returns the created owner object
        return Right(
          Owner(
            id: json['id'] as String,
            address: json['address'] as String,
            phone: json['phone'] as String,
            userId: json['userId'] as String,
          ),
        );
      } catch (e) {
        return Left(GenericFailure('Error parsing owner data: $e'));
      }
    });
  }
}
