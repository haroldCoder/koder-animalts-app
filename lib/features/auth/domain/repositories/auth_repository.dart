import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import 'package:koder_animalts_app/features/auth/data/models/authenticate_params_dto.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> authenticate(
    AuthenticateParamsDto params,
  );
}
