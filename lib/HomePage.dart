import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session_8_flutter4/tabs/ahadeeth_tab.dart';
import 'package:session_8_flutter4/tabs/quran_tab.dart';
import 'package:session_8_flutter4/tabs/radio_tab.dart';
import 'package:session_8_flutter4/tabs/sebha_tab.dart';

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "إسلامي",
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFB7935F),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: index,
          iconSize: 35,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
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
          ],
        ),
        body: tabs[index],
      ),
    );
  }

  List<Widget> tabs = [RadioTab(), SebhaTab(), AhadeethTab(), QuranTab()];
}
