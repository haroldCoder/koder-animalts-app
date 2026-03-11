import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import '../entities/owner.dart';
import '../../data/models/create_owner_dto.dart';

abstract class OwnerRepository {
  Future<Either<Failure, Owner>> createOwner(CreateOwnerDto dto);
}
