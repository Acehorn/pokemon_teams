import 'package:dartz/dartz.dart';
import '../entities/home_entitiy.dart';
import '../failures/failure.dart';

abstract class HomeRepository {

  Future<Either<Failure,HomeEntity>> getPokemonFromDataSource(int pokemonId);

}