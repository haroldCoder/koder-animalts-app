enum MedicalRecordTypeEnum {
  CONSULTATION,
  VACCINATION,
  SURGERY,
  EMERGENCY,
  LAB_RESULTS,
  HOSPITALIZATION,
}

class MedicalRecordsEntity {
  final String id;
  final String visitDate;
  final String reasonForVisit;
  final String diagnosis;
  final String treatment;
  final String petId;
  final String veterinarianId;
  final String createdAt;
  final String updatedAt;
  final MedicalRecordTypeEnum type;

  const MedicalRecordsEntity({
    required this.id,
    required this.visitDate,
    required this.reasonForVisit,
    required this.diagnosis,
    required this.treatment,
    required this.petId,
    required this.veterinarianId,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });
}
