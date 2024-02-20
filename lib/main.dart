import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:session_8_flutter4/HomePage.dart';
import 'package:session_8_flutter4/my_theme.dart';
import 'package:session_8_flutter4/tabs/hadeeth_details.dart';
import 'package:session_8_flutter4/tabs/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      locale: Locale("ar"),
      home: FlutterSplashScreen.fadeIn(
        backgroundImage: Image(
          image: AssetImage("assets/images/splash_background.jpg"),
          alignment: Alignment.center,
        ),
        duration: Duration(seconds: 2),
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen: HomePage(),
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadeethDetails.routeName: (context) => HadeethDetails(),
      },
    );
  }
}
