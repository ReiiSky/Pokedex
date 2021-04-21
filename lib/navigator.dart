import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/changeState.dart';
import 'package:pokedex/bloc/navCubit.dart';
import 'package:pokedex/pokemonSearchResultViews.dart';
import 'package:pokedex/pokemonView.dart';
import 'package:pokedex/pokemondetailsview.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, ChangeState>(builder: (context, state) {
      return Navigator(
        pages: [
          MaterialPage(child: PokedexView()),
          if (state != null)
            if (state.page == "details")
              MaterialPage(child: PokemonDetailsView()),
          if (state != null)
            if (state.page == "search")
              MaterialPage(child: PokemonSearchResultView())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}
