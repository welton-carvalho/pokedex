// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResult _$HomeResultFromJson(Map<String, dynamic> json) => HomeResult(
      (json['results'] as List<dynamic>)
          .map((e) => PokemonHome.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$HomeResultToJson(HomeResult instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
