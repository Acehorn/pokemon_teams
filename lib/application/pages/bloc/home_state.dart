part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final List<PokemonModel> listpokemons;

  const HomeStateLoaded({required this.listpokemons});

  @override
  List<Object> get props => [];
}

class HomeStateError extends HomeState {
  final String messageError;

  const HomeStateError({required this.messageError});

  @override
  List<Object> get props => [];
}
