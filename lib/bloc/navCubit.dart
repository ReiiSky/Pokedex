import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/PokemonDetailsCubit.dart';

class NavCubit extends Cubit<int> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({@required this.pokemonDetailsCubit}) : super(null);
  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.getPokemonDetail(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
  }
}
