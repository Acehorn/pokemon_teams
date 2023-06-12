import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/pokemon_model.dart';
import '../../../domain/usecases/home_usecases.dart';
import '../../core/utils/utils.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
    final HomeUseCases homeUseCases;
  HomeBloc({required this.homeUseCases}) : super(HomeInitial()) {
    int pokemonCounter = 10;
    on<HomeRequestedEvent>((event, emit) async {
      emit(HomeStateLoading());
    
      final failureOrData = await homeUseCases.getPokemons(pokemonCounter);

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
      if (pokemonCounter < 1010) {
         pokemonCounter = pokemonCounter + 10;
        emit(HomeStateLoadingMore());
        final failureOrData = await homeUseCases.getPokemons(pokemonCounter);
        failureOrData.fold(
            (failure) => emit(
                HomeStateError(messageError: mapFailureToMessage(failure))),
            (listPokemon) {
          listLocalPokemon.addAll(listPokemon.pokemonList);

          emit(HomeStateLoaded(listpokemons: listLocalPokemon));
        });
      }
    });
  }
}
