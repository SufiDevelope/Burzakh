import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable{
@override // TODO: implement props
  List<Object?> get props => [];
}

class DashboardInit extends DashboardState{}
class DashboardLoading extends DashboardState{}
class DashboardLoaded extends DashboardState{}
class DashboardError extends DashboardState{}
