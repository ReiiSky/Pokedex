import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/PokemonDetailsCubit.dart';
import 'package:pokedex/bloc/changeState.dart';

class NavCubit extends Cubit<ChangeState> {
  PokemonDetailsCubit pokemonDetailsCubit;
  PokemonSearchCubit pokemonSearchCubit;

  NavCubit(
      {@required this.pokemonDetailsCubit, @required this.pokemonSearchCubit})
      : super(null);

  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.getPokemonDetail(pokemonId);
    emit(ChangeState(page: "details", param: pokemonId));
  }

  void showPokemonSearchResult(String pattern) {
    pokemonSearchCubit.getPokemonWithSearch(pattern);
    emit(ChangeState(page: "search", param: pattern));
  }

  void popToPokedex() {
    emit(null);
    pokemonDetailsCubit.clearPokemonDetails();
    pokemonSearchCubit.clearPokemonSearch();
  }
}
