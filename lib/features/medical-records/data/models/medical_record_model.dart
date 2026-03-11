import 'package:koder_animalts_app/features/medical-records/domain/entities/medical_records_entity.dart';

class MedicalRecordModel extends MedicalRecordsEntity {
  const MedicalRecordModel({
    required super.id,
    required super.visitDate,
    required super.reasonForVisit,
    required super.diagnosis,
    required super.treatment,
    required super.petId,
    required super.veterinarianId,
    required super.createdAt,
    required super.updatedAt,
    required super.type,
  });

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      id: json['id'] as String,
      visitDate: json['visitDate'] as String,
      reasonForVisit: json['reasonForVisit'] as String,
      diagnosis: json['diagnosis'] as String,
      treatment: json['treatment'] as String,
      petId: json['petId'] as String,
      veterinarianId: json['veterinarianId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      type: MedicalRecordTypeEnum.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => MedicalRecordTypeEnum.CONSULTATION,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'visitDate': visitDate,
      'reasonForVisit': reasonForVisit,
      'diagnosis': diagnosis,
      'treatment': treatment,
      'petId': petId,
      'veterinarianId': veterinarianId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'type': type.toString().split('.').last,
    };
  }
}
