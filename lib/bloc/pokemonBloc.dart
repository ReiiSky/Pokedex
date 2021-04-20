import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemonEvent.dart';
import 'package:pokedex/bloc/pokemonState.dart';
import 'package:pokedex/pokemonRepository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final repo = PokemonRepository();
  PokemonBloc() : super(null);

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadInProgress();
    }

    try {
      final pokemonPageResponse = await repo.getPokemon();
      yield PokemonPageLoadSuccess(
          pokemonListings: pokemonPageResponse.pokemonListings,
          canLoadNextPage: pokemonPageResponse.canLoadNextPage);
    } catch (e) {
      yield PokemonPageLoadFailed(error: e);
    }
  }
}
