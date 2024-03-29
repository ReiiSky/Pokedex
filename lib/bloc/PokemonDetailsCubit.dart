import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemonDetails.dart';
import 'package:pokedex/bloc/pokemonInfo.dart';
import 'package:pokedex/bloc/pokemonSpeciesInfo.dart';
import 'package:pokedex/pokemonPageResponse.dart';
import 'package:pokedex/pokemonRepository.dart';

import 'SearchBloc.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final repo = PokemonRepository();
  PokemonDetailsCubit() : super(null);

  void getPokemonDetail(int id) async {
    final info = await repo.getPokemonInfo(id);
    final species = await repo.getPokemonSpecialInfo(id);

    emit(PokemonDetails(
        id: info.id,
        name: info.name,
        imageUrl: info.imageUrl,
        types: info.types,
        height: info.height,
        weight: info.width,
        description: species != null ? species.description : "empty"));
  }

  void clearPokemonDetails() => emit(null);
}

class PokemonSearchCubit extends Cubit<PokemonList> {
  final repo = PokemonRepository();
  PokemonSearchCubit() : super(null);

  void getPokemonWithSearch(String pattern) async {
    final pokemons = await repo.getPokemonWithFilter(pattern);
    emit(PokemonList(list: pokemons));
  }

  void clearPokemonSearch() => emit(null);
}

class PokemonList {
  List<PokemonListing> list;
  PokemonList({
    @required this.list,
  });
}
