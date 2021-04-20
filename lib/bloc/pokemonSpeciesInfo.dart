import 'package:flutter/cupertino.dart';

class PokemonSpecies {
  final String description;

  PokemonSpecies({@required this.description});

  factory PokemonSpecies.fromJSON(Map<String, dynamic> json) {
    String desc = " ";

    if (json["flavor_text_entries"] != null) {
      if ((json["flavor_text_entries"] as List<dynamic>).length > 0) {
        desc = json["flavor_text_entries"][0]["flavor_text"];
      }
    }
    PokemonSpecies(description: desc);
  }
}
