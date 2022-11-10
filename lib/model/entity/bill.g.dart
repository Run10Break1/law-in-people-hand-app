// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      json['billId'] as String,
      json['billNo'] as int,
      json['age'] as int,
      json['billName'] as String,
      json['proposer'] as String?,
      json['proposerKind'] as String,
      json['proposeDate'] == null
          ? null
          : DateTime.parse(json['proposeDate'] as String),
      json['currCommitteeId'] as String?,
      json['currCommittee'] as String?,
      json['committeeDate'] == null
          ? null
          : DateTime.parse(json['committeeDate'] as String),
      json['committeeProcDate'] == null
          ? null
          : DateTime.parse(json['committeeProcDate'] as String),
      json['url'] as String,
      json['procResultCode'] as String?,
      json['procDate'] == null
          ? null
          : DateTime.parse(json['procDate'] as String),
      $enumDecode(_$ProcessStageEnumMap, json['stage']),
      json['overview'] as String?,
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'billId': instance.billId,
      'billNo': instance.billNo,
      'age': instance.age,
      'billName': instance.billName,
      'proposer': instance.proposer,
      'proposerKind': instance.proposerKind,
      'proposeDate': instance.proposeDate?.toIso8601String(),
      'currCommitteeId': instance.currCommitteeId,
      'currCommittee': instance.currCommittee,
      'committeeDate': instance.committeeDate?.toIso8601String(),
      'committeeProcDate': instance.committeeProcDate?.toIso8601String(),
      'url': instance.url,
      'procResultCode': instance.procResultCode,
      'procDate': instance.procDate?.toIso8601String(),
      'stage': _$ProcessStageEnumMap[instance.stage]!,
      'overview': instance.overview,
    };

const _$ProcessStageEnumMap = {
  ProcessStage.reception: 'RECEPTION',
  ProcessStage.committeeReview: 'COMMITTEE_REVIEW',
  ProcessStage.examinationOfLegalityAndWording:
      'EXAMINATION_OF_LEGALITY_AND_WORDING',
  ProcessStage.plenarySitting: 'PLENARY_SITTING',
  ProcessStage.transmissionToTheGovernment: 'TRANSMISSION_TO_THE_GOVERNMENT',
  ProcessStage.governmentReconciliation: 'GOVERNMENT_RECONCILIATION',
  ProcessStage.emergencyCabinetCouncil: 'EMERGENCY_CABINET_COUNCIL',
  ProcessStage.substitutedDisposal: 'SUBSTITUTED_DISPOSAL',
  ProcessStage.ageExpireDisposal: 'AGE_EXPIRE_DISPOSAL',
  ProcessStage.nonRecurringDisposal: 'NON_RECURRING_DISPOSAL',
  ProcessStage.reflectionAmendmentDisposal: 'REFLECTION_AMENDMENT_DISPOSAL',
  ProcessStage.sendBack: 'SEND_BACK',
  ProcessStage.disposal: 'DISPOSAL',
  ProcessStage.withdraw: 'WITHDRAW',
  ProcessStage.denial: 'DENIAL',
  ProcessStage.promulgation: 'PROMULGATION',
};

VotedBill _$VotedBillFromJson(Map<String, dynamic> json) => VotedBill(
      Bill.fromJson(json['bill']),
      json['totalCount'] as int,
      json['agreeCount'] as int,
      json['disagreeCount'] as int,
    );

Map<String, dynamic> _$VotedBillToJson(VotedBill instance) => <String, dynamic>{
      'bill': instance.bill,
      'totalCount': instance.totalCount,
      'agreeCount': instance.agreeCount,
      'disagreeCount': instance.disagreeCount,
    };

SeenBill _$SeenBillFromJson(Map<String, dynamic> json) => SeenBill(
      Bill.fromJson(json['bill']),
      json['totalCount'] as int,
    );

Map<String, dynamic> _$SeenBillToJson(SeenBill instance) => <String, dynamic>{
      'bill': instance.bill,
      'totalCount': instance.totalCount,
    };
