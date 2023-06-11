import 'package:dio/dio.dart';

import '../models/pokemon_model.dart';

abstract class HomeRemoteDatasource {
  /// request the data from api
  /// return [List<PokemonElement>] if successfull
  /// throws a server-exception if status code is not 200
  Future<List<PokemonModel>> getPokemonFromApi(int idPokemon);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
/*   final client = http.Client(); */
/* final dio = Dio();

  @override
  Future<List<PokemonModel>> getPokemonFromApi(int start, int end) async {
    List<PokemonModel> list = [];
    for (var i = start; i < end; i++) {
      final response = await dio.get(
      "https://pokeapi.co/api/v2/pokemon/$i");
     
    

      final responseBody = response.data;

      list.add(PokemonModel(
        id: responseBody["id"],
          name: responseBody["name"],
          sprites:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$i.png",
          types: responseBody["types"][0]["type"]["name"]));
    }

    return list;
  } */


  final dio = Dio();

  @override
  Future<List<PokemonModel>> getPokemonFromApi(int idPokemon) async {
    List<PokemonModel> list = [];

    if(idPokemon == 8){
    for (var i = 1; i < 8; i++) {
      final response = await dio.get(
      "https://pokeapi.co/api/v2/pokemon/$i");
        final responseBody = response.data;

      list.add(PokemonModel(
        id: responseBody["id"],
          name: responseBody["name"],
          sprites:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$i.png",
          types: responseBody["types"][0]["type"]["name"]));
    

   
    }
    } else{
   /*    final response = await dio.get(
      "https://pokeapi.co/api/v2/pokemon/$idPokemon");
     
       final responseBody = response.data;

      list.add(PokemonModel(
        id: responseBody["id"],
          name: responseBody["name"],
          sprites:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$idPokemon.png",
          types: responseBody["types"][0]["type"]["name"])); */

    for (var i = idPokemon; i < idPokemon+2; i++) {
      final response = await dio.get(
      "https://pokeapi.co/api/v2/pokemon/$i");
        final responseBody = response.data;

      list.add(PokemonModel(
        id: responseBody["id"],
          name: responseBody["name"],
          sprites:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$i.png",
          types: responseBody["types"][0]["type"]["name"]));
    

   
    }
    }


    return list;
  }
}
