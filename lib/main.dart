import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/PokemonDetailsCubit.dart';
import 'package:pokedex/bloc/navCubit.dart';
import 'package:pokedex/bloc/pokemonBloc.dart';
import 'package:pokedex/bloc/pokemonEvent.dart';
import 'package:pokedex/navigator.dart';
import 'package:pokedex/pokemonView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext ctx) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (ctx) => PokemonBloc()..add(PokemonPageRequest(page: 0))),
          BlocProvider(
              create: (context) =>
                  NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context) => pokemonDetailsCubit)
        ],
        child: AppNavigator(),
      ),
    );
  }
}
