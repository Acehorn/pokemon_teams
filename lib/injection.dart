import 'package:get_it/get_it.dart';
import 'package:pokemon_teams/application/pages/bloc/home_bloc.dart';
import 'package:pokemon_teams/data/datasources/home_remote_datasources.dart';
import 'package:pokemon_teams/data/repositories/home_repository_impl.dart';
import 'package:pokemon_teams/domain/repositories/home_repository.dart';
import 'package:pokemon_teams/domain/usecases/home_usecases.dart';
import 'package:dio/dio.dart';

final sl = GetIt.I;

Future<void> init() async {
  // ! aplication layer

  sl.registerFactory(() => HomeBloc(homeUseCases: sl()));

// ! domain layer

  sl.registerFactory(() => HomeUseCases(homeRepository: sl()));

// ! data layer

  sl.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDatasource: sl()));
  sl.registerFactory<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(dio: sl()));

// ! externs

  sl.registerFactory(() => Dio());
}
