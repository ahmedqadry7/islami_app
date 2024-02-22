// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:session_8_flutter4/models/sura_model.dart';
import 'package:session_8_flutter4/my_theme.dart';
import 'package:session_8_flutter4/providers/my_provider.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = "suraDetials";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      Future.delayed(Duration(), () {
        readSuraFile(suraModel.suraIndex);
      });
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.getBackgroundPath()),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            suraModel.suraName,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(top: 75),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor,
                      indent: 40,
                      endIndent: 40,
                    );
                  },
                  
                  itemBuilder: (context, index) {
                    return Text(
                      "${verses[index]}(${index + 1})",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.elMessiri(fontSize: 25,
                      color: provider.themeMode == ThemeMode.light ? Colors.black : Color(0xFFFACC1D)),
                      
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      ),
    );
  }

  void readSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> suraLines = sura.split("\n");
    verses = suraLines;
    print(verses.length);
    setState(() {});
  }
}
