import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/navCubit.dart';
import 'package:pokedex/pokemonView.dart';
import 'package:pokedex/pokemondetailsview.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, id) {
      return Navigator(
        pages: [
          MaterialPage(child: PokedexView()),
          if (id != null) MaterialPage(child: PokemonDetailsView())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}
