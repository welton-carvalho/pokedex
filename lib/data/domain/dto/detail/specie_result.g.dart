// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecieResult _$SpecieResultFromJson(Map<String, dynamic> json) => SpecieResult(
      (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SpecieDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecieResultToJson(SpecieResult instance) =>
    <String, dynamic>{
      'flavor_text_entries':
          instance.descriptions?.map((e) => e?.toJson()).toList(),
    };
