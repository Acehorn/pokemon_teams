part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final String elementType;
  final String pokemonName;
  final String sprite;

  const HomeStateLoaded({required this.elementType, required this.pokemonName, required this.sprite});
}

class HomeStateError extends HomeState {
  final String messageError;

  const HomeStateError({required this.messageError});

  @override
  List<Object> get props => [];
}


