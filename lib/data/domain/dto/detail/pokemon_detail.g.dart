// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      (json['height'] as num).toInt(),
      json['name'] as String,
      (json['id'] as num).toInt(),
      (json['weight'] as num).toInt(),
      (json['stats'] as List<dynamic>)
          .map((e) => BaseStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      Species.fromJson(json['species'] as Map<String, dynamic>),
      json['description'] as String?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'height': instance.height,
      'name': instance.name,
      'id': instance.id,
      'weight': instance.weight,
      'stats': instance.stats.map((e) => e.toJson()).toList(),
      'sprites': instance.sprites.toJson(),
      'types': instance.types.map((e) => e.toJson()).toList(),
      'species': instance.species.toJson(),
      'description': instance.description,
    };
