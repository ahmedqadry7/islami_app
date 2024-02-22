import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_8_flutter4/providers/my_provider.dart';
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
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.getBackgroundPath()),
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
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                label: AppLocalizations.of(context)!.tasbeeh),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_ahadeeth.png")),
                label: AppLocalizations.of(context)!.ahadeth),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_quran.png")),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: AppLocalizations.of(context)!.settings)
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
