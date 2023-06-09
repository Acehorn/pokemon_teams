import 'dart:async';
import 'package:pokemon_teams/application/core/utils/utils.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/models/pokemon_model.dart';

Future<void> insertPokemon(PokemonModel dog) async {
  final db = await database;
  await db.insert(
    'pokemons',
    dog.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<PokemonModel>> pokemons() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('pokemons');
  return List.generate(maps.length, (i) {
    return PokemonModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        sprites: maps[i]['sprites'],
        types: maps[i]['types']);
  });
}

Future<void> updateDog(PokemonModel pokemon) async {
  final db = await database;
  await db.update(
    'dogs',
    pokemon.toJson(),
    where: 'id = ?',
    whereArgs: [pokemon.id],
  );
}

Future<void> deletePokemon(int id) async {
  final db = await database;

  await db.delete(
    'pokemons',
    where: 'id = ?',
    whereArgs: [id],
  );
}
