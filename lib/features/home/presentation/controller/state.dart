import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
@override // TODO: implement props
  List<Object?> get props => [];
}

class HomeInit extends HomeState{}
class HomeLoading extends HomeState{}
class HomeLoaded extends HomeState{}
class HomeError extends HomeState{}
