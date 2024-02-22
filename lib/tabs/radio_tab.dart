import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:session_8_flutter4/my_theme.dart';
import 'package:session_8_flutter4/providers/my_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        SizedBox(height: 150),
        Image.asset("assets/images/radio_body.png"),
        SizedBox(height: 50),
        Text(
          "إذاعة القرآن الكريم",
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        "Coming Soon...",
                        style: TextStyle(fontSize: 24),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.skip_previous_sharp,
                  size: 30, color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor,),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        "Coming Soon...",
                        style: TextStyle(fontSize: 24),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.play_arrow_rounded,
                  size: 50, color:provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor,),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        "Coming Soon...",
                        style: TextStyle(fontSize: 24),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.skip_next_sharp,
                  size: 30, color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor,),
            ),
          ],
        )
      ],
    );
  }
}
