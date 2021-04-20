import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemonBloc.dart';
import 'package:pokedex/bloc/pokemonEvent.dart';
import 'package:pokedex/pokemonView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (ctx) => PokemonBloc()..add(PokemonPageRequest(page: 0)))
        ],
        child: PokedexView(),
      ),
    );
  }
}
