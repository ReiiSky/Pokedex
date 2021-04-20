import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemonDetails.dart';
import 'package:pokedex/bloc/pokemonInfo.dart';
import 'package:pokedex/bloc/pokemonSpeciesInfo.dart';
import 'package:pokedex/pokemonRepository.dart';

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
        description: species != null ? species.description : ""));
  }

  void clearPokemonDetails() => emit(null);
}
