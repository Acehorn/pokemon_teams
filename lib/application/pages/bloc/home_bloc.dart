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

      final failureOrData = await homeuseCases.getPokemons();
      /*   final HomeEntity listPokemon = await homeuseCases.getPokemons(); */
      failureOrData.fold(
          (failure) =>
              emit(HomeStateError(messageError: mapFailureToMessage(failure))),
          (listPokemon) =>
              emit(HomeStateLoaded(listpokemons: listPokemon.pokemonList)));
     
    });
   
  }


}
