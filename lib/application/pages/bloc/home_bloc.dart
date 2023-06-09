import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/pokemon_model.dart';
import '../../../domain/usecases/home_usecases.dart';
import '../../core/utils/utils.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeRequestedEvent>((event, emit) async {
      emit(HomeStateLoading());
      final HomeUseCases homeuseCases = HomeUseCases();
      final failureOrData = await homeuseCases.getPokemons(1, 8);

      failureOrData.fold(
          (failure) =>
              emit(HomeStateError(messageError: mapFailureToMessage(failure))),
          (listPokemon) {
        for (var i = 0; i < listPokemon.pokemonList.length; i++) {
          listLocalPokemon.add(listPokemon.pokemonList[i]);
        }
        emit(HomeStateLoaded(listpokemons: listLocalPokemon));
      });
    });

    on<HomeRequestedEventUpdate>((event, emit) async {
      final HomeUseCases homeuseCases = HomeUseCases();
      final failureOrData = await homeuseCases.getPokemons(
          listLocalPokemon.length + 1, listLocalPokemon.length + 8);

      failureOrData.fold(
          (failure) =>
              emit(HomeStateError(messageError: mapFailureToMessage(failure))),
          (listPokemon) {
        listLocalPokemon.addAll(listPokemon.pokemonList);

        emit(HomeStateLoaded(listpokemons: listLocalPokemon));
      });
    });
  }
}
