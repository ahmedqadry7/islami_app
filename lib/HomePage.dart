import 'package:flutter/material.dart';
import 'package:session_8_flutter4/tabs/ahadeeth_tab.dart';
import 'package:session_8_flutter4/tabs/quran_tab.dart';
import 'package:session_8_flutter4/tabs/radio_tab.dart';
import 'package:session_8_flutter4/tabs/sebha_tab.dart';
import 'package:session_8_flutter4/tabs/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "homePage";

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bachground.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_name
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          iconSize: 35,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_radio.png")),
                label: "الراديو"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                label: "التسبيح"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_ahadeeth.png")),
                label: "الأحاديث"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_quran.png")),
                label: "القرآن"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: "settings")
          ],
        ),
        body: tabs[index],
      ),
    );
  }

  List<Widget> tabs = [
    RadioTab(),
    SebhaTab(),
    AhadeethTab(),
    QuranTab(),
    SettingsTab()
  ];
}
