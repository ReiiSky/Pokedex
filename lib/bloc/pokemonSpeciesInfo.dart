import 'package:flutter/cupertino.dart';

class PokemonSpecies {
  final String description;

  PokemonSpecies({@required this.description});

  factory PokemonSpecies.fromJSON(Map<String, dynamic> json) {
    return PokemonSpecies(
        description: json["flavor_text_entries"][0]["flavor_text"]);
  }
}
