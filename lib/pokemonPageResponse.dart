import 'package:flutter/foundation.dart';

class PokemonListing {
  final int id;
  final String name;
  int matchStart;
  int matchEnd;

  String get imageURL =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonListing(
      {@required this.id, @required this.name, this.matchStart, this.matchEnd});

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
    final pokemonListings = (json["results"] as List)
        .map((jsonList) => (PokemonListing.fromJSON(jsonList)))
        .toList();

    return PokemonPageResponse(
        pokemonListings: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}
