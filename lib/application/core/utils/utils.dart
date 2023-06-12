import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pokemon_teams/application/core/utils/shared.dart';
import 'package:sqflite/sqflite.dart';
import '../../../data/models/pokemon_model.dart';
import '../../../domain/failures/failure.dart';




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

class PokemonElement {
  String name;
  String element;
  String sprite;

  PokemonElement(
      {required this.name, required this.element, required this.sprite});
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "API error, try again later";

    case CacheFailure:
      return "Cache failed, please try again";

    default:
      return "Something gone wrong, Please try again later";
  }
}


/*    Set<PokemonModel> favorites = <PokemonModel>{bulbasaur,mew}; */

List<PokemonModel> favorites = [];
List<PokemonModel> listLocalPokemon = [];

// ignore: prefer_typing_uninitialized_variables
var database;


initDB() async {
  
    WidgetsFlutterBinding.ensureInitialized();
   database = openDatabase(

    join(await getDatabasesPath(), 'pokemon_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE pokemons(id INTEGER PRIMARY KEY, name TEXT, sprites TEXT, types TEXT)',
      );
    },
    version: 1,
  );

  favorites = await  pokemons();

}



void mostrarSnackbar(BuildContext context, String mensaje) {
  final snackbar = SnackBar(content: Text(mensaje),
  duration: const Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}