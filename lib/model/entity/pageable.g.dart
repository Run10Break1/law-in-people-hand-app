// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pageable<T> _$PageableFromJson<T>(Map<String, dynamic> json) => Pageable<T>(
      (json['content'] as List<dynamic>)
          .map((e) => BillPageableJsonConvertor<T>().fromJson(e as Object))
          .toList(),
      json['last'] as bool,
      json['totalElements'] as int,
      json['totalPages'] as int,
      json['first'] as bool,
      json['numberOfElements'] as int,
      json['size'] as int,
      json['number'] as int,
      json['empty'] as bool,
    );

Map<String, dynamic> _$PageableToJson<T>(Pageable<T> instance) =>
    <String, dynamic>{
      'content':
          instance.content.map(BillPageableJsonConvertor<T>().toJson).toList(),
      'last': instance.isLast,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'first': instance.isFirst,
      'numberOfElements': instance.numberOfElements,
      'size': instance.size,
      'number': instance.number,
      'empty': instance.isEmpty,
    };
