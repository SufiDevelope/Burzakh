import 'package:equatable/equatable.dart';

abstract class AdminDashboardState extends Equatable{
@override // TODO: implement props
  List<Object?> get props => [];
}

class AdminDashboardInit extends AdminDashboardState{}
class AdminDashboardLoading extends AdminDashboardState{}
class AdminDashboardLoaded extends AdminDashboardState{}
class AdminDashboardError extends AdminDashboardState{}
