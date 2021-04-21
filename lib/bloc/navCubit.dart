import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/PokemonDetailsCubit.dart';
import 'package:pokedex/bloc/changeState.dart';

class NavCubit extends Cubit<ChangeState> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({@required this.pokemonDetailsCubit}) : super(null);
  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.getPokemonDetail(pokemonId);
    emit(ChangeState(page: "details", param: pokemonId));
  }

  void popToPokedex() {
    emit(null);
    pokemonDetailsCubit.clearPokemonDetails();
  }
}
