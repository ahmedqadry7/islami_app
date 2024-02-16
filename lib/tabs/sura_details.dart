// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session_8_flutter4/models/sura_model.dart';

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
    var suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      Future.delayed(Duration(), () {
        readSuraFile(suraModel.suraIndex);
      });
    }

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
            suraModel.suraName,
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.bold),
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
                      color: Color(0xFFB7935F),
                      indent: 40,
                      endIndent: 40,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Text(
                      "${verses[index]}(${index + 1})",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.elMessiri(fontSize: 18),
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
