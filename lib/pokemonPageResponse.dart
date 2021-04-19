import 'package:flutter/foundation.dart';

class PokemonListing {
  final int id;
  final String name;

  PokemonListing({@required this.id, @required this.name});

  factory PokemonListing.fromJSON(Map<String, dynamic> json) {
    final name = json["name"];
    final url = json["url"] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse({
    @required this.pokemonListings,
    @required this.canLoadNextPage,
  });

  factory PokemonPageResponse.fromJSON(Map<String, dynamic> json) {
    final canLoadNextPage = json["next"] != null;
    final pokemonListings = (json["result"] as List)
        .map((jsonList) => (PokemonListing.fromJSON(jsonList)))
        .toList();

    return PokemonPageResponse(
        pokemonListings: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}
