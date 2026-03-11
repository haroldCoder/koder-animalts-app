import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import 'package:koder_animalts_app/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String idUser);
}
