// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NaverNews _$NaverNewsFromJson(Map<String, dynamic> json) => NaverNews(
      json['title'] as String,
      json['originallink'] as String,
      json['link'] as String,
      json['description'] as String,
      DateTime.parse(json['pubDate'] as String),
    );

Map<String, dynamic> _$NaverNewsToJson(NaverNews instance) => <String, dynamic>{
      'title': instance.title,
      'originallink': instance.originalLink,
      'link': instance.link,
      'description': instance.description,
      'pubDate': instance.pubDate.toIso8601String(),
    };
