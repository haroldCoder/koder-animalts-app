import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/user/data/models/user_model.dart';
import 'package:koder_animalts_app/features/user/domain/entities/user.dart';
import 'package:koder_animalts_app/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final HttpClient _httpClient;

  UserRepositoryImpl(this._httpClient);

  @override
  Future<Either<Failure, User>> getUser(String idUser) async {
    final response = await _httpClient.get<Map<String, dynamic>>(
      '/users/$idUser/role',
    );

    return response.fold((failure) => Left(failure), (json) {
      try {
        return Right(UserModel.fromJson(json));
      } catch (e) {
        return Left(GenericFailure('Error parsing user data: $e'));
      }
    });
  }
}
