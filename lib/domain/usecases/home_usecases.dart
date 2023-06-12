import 'package:dartz/dartz.dart';
import 'package:pokemon_teams/domain/repositories/home_repository.dart';
import '../entities/home_entitiy.dart';
import '../failures/failure.dart';

class HomeUseCases {
/*   final  homeRepository = HomeRepositoryImpl(); */
  HomeUseCases({required this.homeRepository});
  final HomeRepository homeRepository;

  Future<Either<Failure, HomeEntity>> getPokemons(int pokemonId) async {
    return homeRepository.getPokemonFromDataSource(pokemonId);
  }
}
