import 'package:dartz/dartz.dart';

import '../../domain/entities/home_entitiy.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasources.dart';


class HomeRepositoryImpl implements HomeRepository {
final HomeRemoteDatasource homeRemoteDatasource = HomeRemoteDatasourceImpl();

  @override
  Future<Either<Failure, HomeEntity>> getPokemonFromDataSource() async {


final result = await homeRemoteDatasource.getPokemonFromApi();

return right(HomeEntity(pokemonList: result));
  }
}
