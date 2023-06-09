import 'package:equatable/equatable.dart';
import '../../data/models/pokemon_model.dart';

class HomeEntity extends Equatable {
  
  final List<PokemonModel> pokemonList;
  
const HomeEntity({required this.pokemonList});

  @override

  List<Object?> get props => [pokemonList];


}