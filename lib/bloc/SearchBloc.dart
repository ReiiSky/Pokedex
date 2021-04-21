import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemonEvent.dart';
import 'package:pokedex/bloc/pokemonState.dart';
import 'package:pokedex/pokemonPageResponse.dart';
import 'package:pokedex/pokemonRepository.dart';
import 'package:pokedex/pokemonView.dart';

class SearchBloc extends Bloc<PokemonEvent, PokemonState> {
  final repo = PokemonRepository();
  SearchBloc() : super(null);

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    try {
      print("abc:1");
      final pokemonPageResponse =
          await repo.getPokemonWithFilter(myController.text);
      print("abc:2");
      yield PokemonPageLoadSuccess(
        pokemonListings: pokemonPageResponse,
        canLoadNextPage: true,
      );
      print("abc:3");
    } catch (e) {
      yield PokemonPageLoadFailed(error: e);
    }
  }
}
