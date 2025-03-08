import 'package:json_annotation/json_annotation.dart';
import 'pokemon_home.dart';

part 'home_result.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeResult {
  List<PokemonHome> results;
  int count;
  HomeResult(this.results, this.count);

  factory HomeResult.fromJson(Map<String, dynamic> json) =>
      _$HomeResultFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResultToJson(this);
}
