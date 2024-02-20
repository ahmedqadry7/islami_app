// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session_8_flutter4/tabs/hadeeth_details.dart';
import 'package:session_8_flutter4/models/hadeethModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadeethTab extends StatefulWidget {
  AhadeethTab({super.key});

  @override
  State<AhadeethTab> createState() => _AhadeethTabState();
}

class _AhadeethTabState extends State<AhadeethTab> {
  List<HadeethModel> ahadeethData = [];

  @override
  Widget build(BuildContext context) {
    if(ahadeethData.isEmpty){
      readHadeethFile();
    }
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/ahadeeth_header.png"),
          Divider(color: Color(0xFFB7935F), thickness: 3),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            style: GoogleFonts.elMessiri(
                fontWeight: FontWeight.w600, fontSize: 25),
          ),
          Divider(color: Color(0xFFB7935F), thickness: 3),
          //List Viewwwwwwwwwwwww
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: Color(0xFFB7935F),
              endIndent: 40,
              indent: 40,
              height: 35,
            ),
              itemBuilder: (context, index) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadeethDetails.routeName,
                        arguments: ahadeethData[index]);
                    },
                    child: Text(
                      ahadeethData[index].title,
                      style: GoogleFonts.elMessiri(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              },
              itemCount: ahadeethData.length,
            ),
          )
        ],
      ),
    );
  }

  void readHadeethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((hadeethFile) {
      List<String> ahadeth = hadeethFile.split("#");
      for (int i = 0; i < ahadeth.length; i++) {
        String hadeethOne = ahadeth[i];
        List<String> hadethLines = hadeethOne.trim().split("\n");
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> hadethContent = hadethLines;
        ahadeethData.add(HadeethModel(content: hadethContent, title: title));
      }
      setState(() {
      
    });
    });
    
  }
}
