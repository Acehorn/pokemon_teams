import 'package:equatable/equatable.dart';
import '../../domain/entities/home_entitiy.dart';

class PokemonList extends HomeEntity with EquatableMixin {
    PokemonList({  
   required List<PokemonModel> listPokemon,

    }) : super (pokemonList: listPokemon);

   
    factory PokemonList.fromJson(Map<String, dynamic> json){
     return PokemonList(listPokemon: json["pokemonList"]);
    }


}

class PokemonModel {
    PokemonModel({
        required this.name,
        required this.sprites,
        required this.types,
        required this.id
    });

    String name;
    String sprites;
    String types;
    int id;
    
    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        sprites: json["sprites"],
        types: json["types"], id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "sprites": sprites,
        "types": types,
        "id": id
    };




}

class Sprites {
    Sprites({
        required this.backDefault,
        this.backFemale,
        required this.backShiny,
        this.backShinyFemale,
        required this.frontDefault,
        this.frontFemale,
        required this.frontShiny,
        this.frontShinyFemale,
    });

    String backDefault;
    dynamic backFemale;
    String backShiny;
    dynamic backShinyFemale;
    String frontDefault;
    dynamic frontFemale;
    String frontShiny;
    dynamic frontShinyFemale;

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
    };
}



