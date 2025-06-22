import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:burzakh/features/dashboard/presentation/controller/state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInit());

  int screenIndex = 2;

  void changeScreenIndex(int value) {
    emit(DashboardInit());
    screenIndex = value;
    emit(DashboardLoaded());
  }

  void getIndex(int value) => changeScreenIndex(value);
}
