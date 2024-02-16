import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:session_8_flutter4/HomePage.dart';
import 'package:session_8_flutter4/tabs/hadeeth_details.dart';
import 'package:session_8_flutter4/tabs/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
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
