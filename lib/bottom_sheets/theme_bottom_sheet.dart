// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:session_8_flutter4/my_theme.dart';
import 'package:session_8_flutter4/providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light",
                  style: GoogleFonts.elMessiri(
                      fontSize: 30,
                      color: provider.themeMode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : Colors.white),
                ),
                if (provider.themeMode == ThemeMode.light) ...[
                  Icon(Icons.done, size: 35, color: MyThemeData.primaryColor),
                ]
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark",
                  style: GoogleFonts.elMessiri(
                      fontSize: 30,
                      color: provider.themeMode == ThemeMode.dark
                          ? MyThemeData.yellowColor
                          : MyThemeData.blackColor),
                ),
                if (provider.themeMode == ThemeMode.dark) ...[
                  Icon(Icons.done, size: 35, color: MyThemeData.yellowColor),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
