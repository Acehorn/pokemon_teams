import 'package:dartz/dartz.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../entities/home_entitiy.dart';
import '../failures/failure.dart';

class HomeUseCases {

  final  homeRepository = HomeRepositoryImpl();

  Future<Either<Failure,HomeEntity>> getPokemons(int start, int end) async {


   return homeRepository.getPokemonFromDataSource(start,end);


  }
}
