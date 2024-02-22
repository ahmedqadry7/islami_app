import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:session_8_flutter4/my_theme.dart';
import 'package:session_8_flutter4/providers/my_provider.dart';

class SebhaTab extends StatefulWidget {

  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0 , index = 0;

  List<String>azkar = ["سبحان الله" , "الحمدلله" , "الله اكبر" , "لا اله الا الله"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 50),
            child: Image.asset(provider.getHeadOfSebhaPath()),
          ),
          InkWell(
            onTap: () {
              counter++;
              if(counter == 33){
                index++;
                counter = 0;
              }
              if(index == 4){
                index = 0;
              }
              setState(() {});
            },
            child: Image.asset(provider.getBodyOfSebhaPath())),
          SizedBox(height: 35),
          Text(
            "عدد التسبيحات",
            style: GoogleFonts.elMessiri(
                color: provider.themeMode == ThemeMode.light ? Colors.black : Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
                color: provider.themeMode == ThemeMode.light ? Color(0xFFB7935F) : Color(0xFF151C31),
                borderRadius: BorderRadius.circular(25)),
            width: 69,
            height: 81,
            child: Center(
              child: Text(
                counter.toString(),
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 137,
            height: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor,
            ),
            child: Center(
                child: Text(
              azkar[index],
              style: GoogleFonts.elMessiri(
                fontSize: 25,
                color: provider.themeMode == ThemeMode.light ? Colors.white : Colors.black,
              ),
            )),
          )
        ],
      ),
    );
  }
}
