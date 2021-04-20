import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/PokemonDetailsCubit.dart';

import 'bloc/pokemonDetails.dart';

class PokemonDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemon Details"),
        ),
        body: BlocBuilder<PokemonDetailsCubit, PokemonDetails>(
          builder: (context, details) {
            return details != null
                ? Center(child: Text(details.name))
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
