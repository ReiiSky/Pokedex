import 'dart:convert';

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
