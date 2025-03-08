// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseStat _$BaseStatFromJson(Map<String, dynamic> json) => BaseStat(
      (json['base_stat'] as num).toInt(),
      Stat.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseStatToJson(BaseStat instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat.toJson(),
    };
