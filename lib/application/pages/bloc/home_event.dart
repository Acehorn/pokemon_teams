part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class HomeRequestedEvent extends HomeEvent {}


class HomeRequestedEventUpdate extends HomeEvent {}