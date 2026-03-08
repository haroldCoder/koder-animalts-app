import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:koder_animalts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:koder_animalts_app/features/auth/data/models/authenticate_params_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final HttpClient _httpClient;

  AuthRepositoryImpl(this._httpClient);

  @override
  Future<Either<Failure, Map<String, dynamic>>> authenticate(
    AuthenticateParamsDto params,
  ) async {
    return _httpClient.post<Map<String, dynamic>>(
      '/auth/login',
      data: params.toJson(),
    );
  }
}
