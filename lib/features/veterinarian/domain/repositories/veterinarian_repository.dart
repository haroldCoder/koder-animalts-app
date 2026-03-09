import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import '../entities/veterinarian.dart';
import '../../data/models/create_veterinarian_dto.dart';

abstract class VeterinarianRepository {
  Future<Either<Failure, Veterinarian>> createVeterinarian(
    CreateVeterinarianDto dto,
  );
}
