
import 'package:burzakh/core/app/myapp.dart';
import 'package:burzakh/core/domain/connectivity/presentaion/connectivity_controller.dart';
import 'package:burzakh/features/splash/presentation/page/splash_screen.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/localization/localization_getx.dart';
import '../../../../widgets/app_text.dart';



class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
      var localizationController = Get.find<LocalizationGetx>();
      localizationController.selectLocal(context);
       ConnectivityController().init();

    },);
    super.initState();
  }
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var localizationController = Get.find<LocalizationGetx>();
    return Scaffold(
      appBar: AppBar(title: AppText(text:"Translation Screen",)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text:"Choose your language:",),
            RadioListTile<Locale>(
              title:AppText(text:"English"),
              value: Locale('en'),
              groupValue: localizationController.lang.value,
              onChanged: (Locale? locale) {
                // localization
                if (locale != null) localizationController.updateUi(locale,context);
              },
            ),
            RadioListTile<Locale>(
              title: AppText(text:"Chinese"),
              value: Locale('zh'),
              groupValue:  localizationController.lang.value,
              onChanged: (Locale? locale) {

                if (locale != null) localizationController.updateUi(locale,context);
              },
            ),

            AppText(text: localizationController.themeMode.value!=ThemeMode.light?"dark":'light'),
            Switch(value: localizationController.themeMode.value!=ThemeMode.light, onChanged: (value) {
              localizationController.toggleTheme();
            },),
            CustomElevatedButton(onPressed: () {
              navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => SplashScreen(),));
            }, text: 'next'),
         ],
        ),
      ),
    );
  }
}


