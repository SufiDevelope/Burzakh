import 'package:burzakh/features/admin_dashboard/presentation/controller/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDashboardCubit extends Cubit<AdminDashboardState> {

  AdminDashboardCubit() : super(AdminDashboardInit());


  int screenIndex=0;

  void getIndex(int value){
    emit(AdminDashboardInit());
    screenIndex=value;
    emit(AdminDashboardLoaded());
  }
}
