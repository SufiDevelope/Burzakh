import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/app/myapp.dart';
import 'package:burzakh/core/localization/app_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

Future<EasyLocalization> provider() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final diContainer = DiContainer();
  await diContainer.init();
  return EasyLocalization(
      supportedLocales: [AppLocalization.enLocal,AppLocalization.ruLocal,AppLocalization.mlLocal,AppLocalization.zhLocal, AppLocalization.zhLocal,AppLocalization.arLocal,AppLocalization.urLocal],
      path: AppLocalization.translationPath,
      startLocale: AppLocalization.enLocal,
      fallbackLocale: AppLocalization.enLocal,
      child: Builder(
        builder: (context) {
          return MyApp();
        }
      ));
}
