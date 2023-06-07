import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeRequestedEvent>((event, emit) async {
     emit(HomeStateLoading());
     debugPrint("fake get data");
    await Future.delayed(const Duration(seconds: 4), (){});
     debugPrint("got data");
     emit(const HomeStateLoaded(elementType: "dark", pokemonName: "Umbreon", sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/197.png"));
     
    });
   
  }

}
