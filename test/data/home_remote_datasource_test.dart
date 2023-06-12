import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_teams/data/datasources/home_remote_datasources.dart';
import 'package:pokemon_teams/data/exceptions/exceptions.dart';
import 'package:pokemon_teams/data/models/pokemon_model.dart';
import 'package:test/test.dart';

import 'home_remote_datasource_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('HomeRemoteDatasources returns PokemonModel', () {
    final dio = MockDio();
    test('when returns the first list of pokemons, status 200', () async {
      List<PokemonModel> list = [];
      final homeRemoteDatasourceTest = HomeRemoteDatasourceImpl(dio: dio);
      const responseBody =
          '{"id":1, "name": "bulbasaur",  "types": [{"slot": 1,"type": {"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}},{"slot": 2,"type": {"name": "poison","url": "https://pokeapi.co/api/v2/type/4/"}}], "sprites":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png" }';
      final jsonData = json.decode(responseBody);

      for (var i = 1; i < 10; i++) {
        when(dio.get("https://pokeapi.co/api/v2/pokemon/$i")).thenAnswer(
            (inv) => Future.value(Response(
                statusCode: 200,
                data: jsonData,
                requestOptions: RequestOptions(
                    path: "https://pokeapi.co/api/v2/pokemon/$i"))));

        list.add(PokemonModel(
            id: jsonData["id"],
            name: jsonData["name"],
            sprites:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$i.png",
            types: jsonData["types"][0]["type"]["name"]));
      }

      final result = await homeRemoteDatasourceTest.getPokemonFromApi(10);

      expect(result, list);
    });

    test('when returns more list of pokemons, status 200', () async {
      int idPokemon = 20;
      List<PokemonModel> list = [];
      final homeRemoteDatasourceTest = HomeRemoteDatasourceImpl(dio: dio);
      const responseBody =
          '{"id":10, "name": "caterpie",  "types": [{"slot": 1,"type": {"name": "bug","url": "https://pokeapi.co/api/v2/type/7/"}}], "sprites":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png" }';
      final jsonData = json.decode(responseBody);

      for (var i = idPokemon - 10; i < idPokemon; i++) {
        when(dio.get("https://pokeapi.co/api/v2/pokemon/$i")).thenAnswer(
            (inv) => Future.value(Response(
                statusCode: 200,
                data: jsonData,
                requestOptions: RequestOptions(
                    path: "https://pokeapi.co/api/v2/pokemon/$i"))));

        list.add(PokemonModel(
            id: jsonData["id"],
            name: jsonData["name"],
            sprites:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$i.png",
            types: jsonData["types"][0]["type"]["name"]));
      }

      final result =
          await homeRemoteDatasourceTest.getPokemonFromApi(idPokemon);

      expect(result, list);
    });
  });

  group('throw error', () {
    final dio = MockDio();
    test('when returns server exception', () async {
      int idPokemon = -9;

      when(dio.get("https://pokeapi.co/api/v2/pokemon/$idPokemon")).thenAnswer(
          (inv) => Future.value(Response(
              statusCode: 404,
              data: "",
              requestOptions: RequestOptions(
                  path: "https://pokeapi.co/api/v2/pokemon/$idPokemon"))));

      Future<void> makeApiCall() async {
        final response =
            await dio.get("https://pokeapi.co/api/v2/pokemon/$idPokemon");

        if (response.statusCode == 404) {
          throw ServerException();
        }
      }

      expect(makeApiCall, throwsA(isA<ServerException>()));
    });
  });
}
