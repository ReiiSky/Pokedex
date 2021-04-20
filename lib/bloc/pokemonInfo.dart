import 'package:flutter/cupertino.dart';

class PokemonInfo {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int width;

  PokemonInfo(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.types,
      @required this.height,
      @required this.width});

  factory PokemonInfo.fromJSON(Map<String, dynamic> json) {
    final types = (json["types"] as List)
        .map((e) => e["type"]["name"] as String)
        .toList();

    return PokemonInfo(
      id: json["id"],
      name: json["name"],
      imageUrl: json["sprites"]["front_default"],
      types: types,
      height: json["height"],
      width: json["weight"],
    );
  }
}
