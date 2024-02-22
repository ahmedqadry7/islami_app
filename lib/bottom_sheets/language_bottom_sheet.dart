// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:session_8_flutter4/my_theme.dart';
import 'package:session_8_flutter4/providers/my_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "English",
                  style: GoogleFonts.elMessiri(
                      fontSize: 30,
                      color: provider.languageCode == "en"
                          ? MyThemeData.primaryColor
                          : MyThemeData.blackColor),
                ),
                if (provider.languageCode == "en") ...[
                  Icon(Icons.done, size: 35, color: MyThemeData.primaryColor),
                ]
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Arabic",
                  style: GoogleFonts.elMessiri(
                      fontSize: 30,
                      color: provider.languageCode == "ar"
                          ? MyThemeData.primaryColor
                          : MyThemeData.blackColor),
                ),
                if (provider.languageCode == "ar") ...[
                  Icon(Icons.done, size: 35, color: MyThemeData.primaryColor),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
