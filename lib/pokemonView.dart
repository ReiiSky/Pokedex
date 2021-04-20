import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemonBloc.dart';
import 'package:pokedex/bloc/pokemonState.dart';

class PokedexView extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon Guided"),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            final gridView = GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.pokemonListings.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Column(
                      children: [
                        Image.network(state.pokemonListings[index].imageURL),
                        Text(state.pokemonListings[index].name)
                      ],
                    ),
                  ),
                );
              },
            );

            return Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: "Search Pokemon Name"),
                        controller: myController,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: gridView,
                ),
              ],
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
