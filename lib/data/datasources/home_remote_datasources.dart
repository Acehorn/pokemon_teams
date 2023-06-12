import 'package:dio/dio.dart';
import 'package:pokemon_teams/domain/failures/failure.dart';

import '../models/pokemon_model.dart';

abstract class HomeRemoteDatasource {
  /// request the data from api
  /// return [List<PokemonElement>] if successfull
  /// throws a server-exception if status code is not 200
  Future<List<PokemonModel>> getPokemonFromApi(int idPokemon);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  var dio = Dio();
  HomeRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<PokemonModel>> getPokemonFromApi(int idPokemon) async {
    List<PokemonModel> list = [];

    if (idPokemon == 10) {
      for (var i = 1; i < 10; i++) {
        final response = await dio.get("https://pokeapi.co/api/v2/pokemon/$i");
        final responseBody = response.data;
        if (response.statusCode != 200) {
          throw ServerFailure();
        } else {
          list.add(PokemonModel(
              id: responseBody["id"],
              name: responseBody["name"],
              sprites:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$i.png",
              types: responseBody["types"][0]["type"]["name"]));
        }
      }
    } else {
      for (var i = idPokemon - 10; i < idPokemon; i++) {
        final response = await dio.get("https://pokeapi.co/api/v2/pokemon/$i");
        final responseBody = response.data;

        if (response.statusCode != 200) {
          throw ServerFailure();
        } else {
          list.add(PokemonModel(
              id: responseBody["id"],
              name: responseBody["name"],
              sprites:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$i.png",
              types: responseBody["types"][0]["type"]["name"]));
        }
      }
    }

    return list;
  }
}
