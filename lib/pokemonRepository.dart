import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
