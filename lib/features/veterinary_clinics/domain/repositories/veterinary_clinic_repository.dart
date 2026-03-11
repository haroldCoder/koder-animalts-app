import 'package:dartz/dartz.dart';
import 'package:koder_animalts_app/core/errors/failures.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/domain/entities/veterinary_clinic.dart';

abstract class VeterinaryClinicRepository {
  Future<Either<Failure, List<VeterinaryClinic>>> getAllClinics();
}
