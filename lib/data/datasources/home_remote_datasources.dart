import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';

abstract class HomeRemoteDatasource {
  /// request the data from api
  /// return [List<PokemonElement>] if successfull
  /// throws a server-exception if status code is not 200
  Future<List<PokemonModel>> getPokemonFromApi();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final client = http.Client();

  @override
  Future<List<PokemonModel>> getPokemonFromApi() async {
    List<PokemonModel> list = [];
    for (var i = 1; i < 152; i++) {
      final response = await client.get(
        Uri.parse("https://pokeapi.co/api/v2/pokemon/$i"),
        headers: {
          "content-type": "application/json",
        },
      );

      final responseBody = json.decode(response.body);

      list.add(PokemonModel(
        id: responseBody["id"],
          name: responseBody["name"],
          sprites:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$i.png",
          types: responseBody["types"][0]["type"]["name"]));
    }

    return list;
  }
}