import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/SearchBloc.dart';
import 'package:pokedex/bloc/navCubit.dart';
import 'package:pokedex/bloc/pokemonBloc.dart';
import 'package:pokedex/bloc/pokemonState.dart';
import 'package:pokedex/pokemonPageResponse.dart';

import 'bloc/PokemonDetailsCubit.dart';

class PokemonSearchResultView extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon Search Result"),
      ),
      body: BlocBuilder<PokemonSearchCubit, PokemonList>(
        builder: (context, state) {
          if (state == null) {
            return Container();
          }

          final gridView = GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => BlocProvider.of<NavCubit>(context)
                    .showPokemonDetails(state.list[index].id),
                child: Card(
                  child: GridTile(
                    child: Column(
                      children: [
                        Image.network(state.list[index].imageURL),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text: state.list[index].name
                                    .substring(0, state.list[index].matchStart),
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                  text: state.list[index].name.substring(
                                      state.list[index].matchStart,
                                      state.list[index].matchEnd),
                                  style: TextStyle(color: Colors.orange)),
                              TextSpan(
                                text: state.list[index].name
                                    .substring(state.list[index].matchEnd),
                                style: TextStyle(color: Colors.black),
                              ),
                            ])),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

          return gridView;
        },
      ),
    );
  }
}
