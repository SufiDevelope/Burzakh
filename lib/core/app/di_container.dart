import 'package:burzakh/core/domain/connectivity/data/datasource/datasource.dart';
import 'package:burzakh/core/domain/connectivity/data/repository_impl/repository_impl.dart';
import 'package:burzakh/core/domain/connectivity/domain/repository/repository.dart';
import 'package:burzakh/core/domain/connectivity/domain/usecase/usecase.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/features/admin_dashboard/presentation/controller/cubit.dart';
import 'package:burzakh/features/authentication/data/datasource/datasource.dart';
import 'package:burzakh/features/authentication/data/repository_impl/repository_impl.dart';
import 'package:burzakh/features/authentication/domain/repository/repository.dart';
import 'package:burzakh/features/authentication/domain/usecase/usecase.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/emirati_svcs/data/datasource/datasource.dart';
import 'package:burzakh/features/emirati_svcs/data/repository_impl/repository_impl.dart';
import 'package:burzakh/features/emirati_svcs/domain/repository/repository.dart';
import 'package:burzakh/features/emirati_svcs/domain/usecase/usecase.dart';
import 'package:burzakh/features/home/data/datasource/datasource.dart';
import 'package:burzakh/features/home/data/model/document_upload_model.dart';
import 'package:burzakh/features/home/data/repository_impl/repository_impl.dart';
import 'package:burzakh/features/home/domain/repository/repository.dart';
import 'package:burzakh/features/home/domain/usecase/usecase.dart';
import 'package:burzakh/features/new_ui/chat/cubit/chat_cubit.dart';
import 'package:burzakh/features/new_ui/chat/data/datasource/chat_datasource.dart';
import 'package:burzakh/features/new_ui/chat/data/repository_imp/repository_imp.dart';
import 'package:burzakh/features/new_ui/chat/domain/repository/chat_repository.dart';
import 'package:burzakh/features/new_ui/chat/domain/usecase/chat_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../features/dashboard/presentation/controller/cubit.dart';
import '../../features/emirati_svcs/presentation/controller/cubit.dart';
import '../../features/home/presentation/controller/cubit.dart';
import '../domain/connectivity/presentaion/connectivity_controller.dart';

class DiContainer{
 final sl=GetIt.instance;

  Future<void> init()async{
    WidgetsFlutterBinding.ensureInitialized();
    sl.registerLazySingleton(() => LocalizationGetx(),);
    executeFirstTime();
    cubits();
  }

  Future<void> executeFirstTime()async{
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    //// internet connection
    sl.registerLazySingleton<DataSourceConnection>(() => CheckInternetClassConnection(),);
    sl.registerLazySingleton<RepositoryConnection>(() => ConnectionImpl(dataSourceConnection: sl()),);
    sl.registerLazySingleton(() => UseCaseConnection(repository: sl()),);

    //// authentication
    sl.registerLazySingleton<AuthenticationDataSource>(() => SignUpFunctions(),);
    sl.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(dataSourceName: sl()),);
    sl.registerLazySingleton(() => AuthenticationUseCase(repository: sl()),);

    //// upload document
    sl.registerLazySingleton<DocumentDataSource>(() => DocumentProcess(),);
    sl.registerLazySingleton<DocumentRepo>(() => DocumentRepoImpl(dataSourceName: sl()),);
    sl.registerLazySingleton(() => DocumentUseCase(repository: sl()),);


    //// emirati
    sl.registerLazySingleton<EmiratiDataSource>(() => EmiratiFunctionClass(),);
    sl.registerLazySingleton<EmiratiRepository>(() => EmiratiRepositoryImpl(dataSourceName: sl()),);
    sl.registerLazySingleton(() => EmiratiUseCase(repository: sl()),);

    //// chat
    sl.registerLazySingleton<ChatDatasource>(() => UserChat(),);
    sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImp(datasource: sl()),);
    sl.registerLazySingleton(() => ChatUsecase(chatRepository: sl()),);

    ConnectivityController().init();
    await sl.allReady();
  }

  //// cubits
  void cubits()async{
    sl.registerLazySingleton(() => DashboardCubit(),);
    sl.registerLazySingleton(() => AdminDashboardCubit(),);
    sl.registerLazySingleton(() => AuthenticationCubit(sl()),);
    sl.registerLazySingleton(() => HomeCubit(sl(),sl()),);
    sl.registerLazySingleton(() => EmirateSvcsCubit(sl(),sl()),);
    sl.registerLazySingleton(() => ChatCubit(authenticationCubit: sl(),usecase: sl()),);
  }
}