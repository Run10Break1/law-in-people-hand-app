import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:law_in_people_hand/model/entity/pageable.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill implements HavingBill {

  static const int jsonUID = 11111111;

  final String billId;
  final int billNo;
  final int age;
  final String billName;
  final String? proposer;
  final String proposerKind;
  final DateTime? proposeDate;
  final String? currCommitteeId;
  final String? currCommittee;
  final DateTime? committeeDate;
  final DateTime? committeeProcDate;
  final String url;
  final String? procResultCode;
  final DateTime? procDate;
  final ProcessStage stage;
  final String? overview;
  final String? trimmedOverview;

  @override
  Bill get bill => this;

  Bill(
      this.billId,
      this.billNo,
      this.age,
      this.billName,
      this.proposer,
      this.proposerKind,
      this.proposeDate,
      this.currCommitteeId,
      this.currCommittee,
      this.committeeDate,
      this.committeeProcDate,
      this.url,
      this.procResultCode,
      this.procDate,
      this.stage,
      this.overview,
      ) : trimmedOverview = overview == null ? null : (overview.startsWith("제안이유 및 주요내용") ? overview.substring(11) : overview);

  factory Bill.fromJson(dynamic json) => _$BillFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum ProcessStage {
  reception('접수'),
  committeeReview('위원회 심사'),
  examinationOfLegalityAndWording('체계자구 심사'),
  plenarySitting('본회의 심의'),
  transmissionToTheGovernment('정부 이송'),
  governmentReconciliation('정부 재의'),
  emergencyCabinetCouncil('비상국무회의로 이관'),
  substitutedDisposal('대안반영폐기'),
  ageExpireDisposal('임기만료폐기'),
  nonRecurringDisposal('회기불계속폐기'),
  reflectionAmendmentDisposal('수정안반영폐기'),
  sendBack('반려'),
  disposal('폐기'),
  withdraw('철회'),
  denial('부결'),
  promulgation('공포');

  final String name;

  const ProcessStage(this.name);
}

abstract class HavingBill {
  Bill get bill;
}

abstract class HavingCount {
  int get count;
}

abstract class BillWithCount implements HavingBill, HavingCount {

}

@JsonSerializable()
class VotedBill implements BillWithCount {

  static const int jsonUID = 11111112;

  @override
  final Bill bill;
  final int totalCount;
  final int agreeCount;
  final int disagreeCount;

  @override
  int get count => totalCount;

  VotedBill(
      this.bill,
      this.totalCount,
      this.agreeCount,
      this.disagreeCount,
      );

  factory VotedBill.fromJson(dynamic json) => _$VotedBillFromJson(json);
}

@JsonSerializable()
class SeenBill implements BillWithCount {

  static const int jsonUID = 111111113;

  @override
  final Bill bill;
  final int totalCount;

  @override
  int get count => totalCount;

  SeenBill(
      this.bill,
      this.totalCount,
      );

  factory SeenBill.fromJson(dynamic json) => _$SeenBillFromJson(json);
}