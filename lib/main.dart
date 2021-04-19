import 'package:flutter/material.dart';
import 'package:pokedex/pokemonView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: PokedexView(),
    );
  }
}
