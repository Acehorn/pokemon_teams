import 'package:flutter/material.dart';

List<String> elementsPokemon = [
  "bug",
  "dark",
  "dragon",
  "electric",
  "fairy",
  "fighting",
  "fire",
  "flying",
  "ghost",
  "grass",
  "ground",
  "ice",
  "normal",
  "poison",
  "psychic",
  "rock",
  "steel",
  "water",
];

String typeElementIcon(String element) {
  if (elementsPokemon.contains(element)) {
    return "assets/elements/$element.svg";
  } else {
    return "assets/elements/normal.svg";
  }
}

typeElementColor(String element) {
  switch (element) {
    case "bug":
      return Colors.lightGreen;
    case "dark":
      return Colors.black;
    case "dragon":
      return Colors.blueAccent;
    case "electric":
      return Colors.yellowAccent[700];
    case "fairy":
      return Colors.pinkAccent;
    case "fighting":
      return Colors.redAccent;
    case "fire":
      return Colors.orange;
    case "flying":
      return Colors.lightBlueAccent;
    case "ghost":
      return Colors.deepPurple;
    case "grass":
      return Colors.green;
    case "ground":
      return Colors.brown;
    case "ice":
      return Colors.cyan;
    case "normal":
      return Colors.grey;
    case "poison":
      return Colors.purple;
    case "psychic":
      return Colors.deepOrangeAccent;
    case "rock":
      return Colors.brown;
    case "steel":
      return Colors.blueGrey;
    case "water":
      return Colors.blue;
  }
  return Colors.grey;
}