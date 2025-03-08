import 'package:json_annotation/json_annotation.dart';
import 'pokemon_image.dart';

part 'other.g.dart';

@JsonSerializable(explicitToJson: true)
class Other {
  @JsonKey(name: "official-artwork")
  PokemonImage image;

  Other(this.image);

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
  Map<String, dynamic> toJson() => _$OtherToJson(this);
}
