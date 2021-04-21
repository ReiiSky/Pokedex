import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/changeState.dart';
import 'package:pokedex/bloc/navCubit.dart';
import 'package:pokedex/bloc/pokemonBloc.dart';
import 'package:pokedex/bloc/pokemonState.dart';

final myController = TextEditingController();

class PokedexView extends StatelessWidget {
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
                return GestureDetector(
                  onTap: () => BlocProvider.of<NavCubit>(context)
                      .showPokemonDetails(state.pokemonListings[index].id),
                  child: Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokemonListings[index].imageURL),
                          Text(state.pokemonListings[index].name)
                        ],
                      ),
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
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          BlocProvider.of<NavCubit>(ctx)
              .showPokemonSearchResult(myController.text);
        },
        tooltip: "Search",
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
