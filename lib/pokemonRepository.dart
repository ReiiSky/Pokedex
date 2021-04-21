import 'dart:convert';
import 'dart:js';

import 'package:http/http.dart' as http;
import 'package:pokedex/bloc/pokemonInfo.dart';
import 'package:pokedex/bloc/pokemonSpeciesInfo.dart';
import 'pokemonPageResponse.dart';

class PokemonRepository {
  final baseUrl = "pokeapi.co";
  final client = http.Client();

  Future<PokemonPageResponse> getPokemon() async {
    final queryParam = {"limit": "151"};

    final uri = Uri.https(baseUrl, "/api/v2/pokemon", queryParam);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJSON(json);
  }

  Future<List<PokemonListing>> getPokemonWithFilter(String search) async {
    final queryParam = {"limit": "151"};
    search = search.toLowerCase();
    final uri = Uri.https(baseUrl, "/api/v2/pokemon", queryParam);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    var pokemons = PokemonPageResponse.fromJSON(json);
    List<PokemonListing> pokess = JsArray();

    for (var i = 0; i < pokemons.pokemonListings.length; i++) {
      var poke = pokemons.pokemonListings[i];
      final start = poke.name.indexOf(search);
      if (start != -1) {
        poke.matchStart = start;
        poke.matchEnd = start + search.length;
        pokess.add(poke);
      }
    }

    return pokess;
  }

  Future<PokemonInfo> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      final x = PokemonInfo.fromJSON(json);
      return x;
    } catch (e) {
      print(e);
    }
  }

  Future<PokemonSpecies> getPokemonSpecialInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpecies.fromJSON(json);
    } catch (e) {
      print(e);
    }
  }
}
