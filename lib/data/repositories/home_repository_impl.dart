import 'package:dartz/dartz.dart';
import 'package:pokemon_teams/data/exceptions/exceptions.dart';

import '../../domain/entities/home_entitiy.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasources.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.homeRemoteDatasource});
  final HomeRemoteDatasource homeRemoteDatasource;

  @override
  Future<Either<Failure, HomeEntity>> getPokemonFromDataSource(
      int pokemonId) async {
    try {
      final result = await homeRemoteDatasource.getPokemonFromApi(pokemonId);
      return right(HomeEntity(pokemonList: result));
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
