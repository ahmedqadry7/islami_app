import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:session_8_flutter4/models/hadeethModel.dart';
import 'package:session_8_flutter4/my_theme.dart';
import 'package:session_8_flutter4/providers/my_provider.dart';

class HadeethDetails extends StatelessWidget {
  static const String routeName = "hadeethDetails";
  const HadeethDetails({super.key}); 

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var hadeethModel =
        ModalRoute.of(context)!.settings.arguments as HadeethModel;
    List<String> Alhadeeth = hadeethModel.content;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.getBackgroundPath()),
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
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: provider.themeMode == ThemeMode.light ? Colors.white : Color(0xFF141A2E)),
            child: Column(
              children: [
                Text(
                  "${hadeethModel.title}",
                  style: GoogleFonts.elMessiri(
                      fontSize: 20, fontWeight: FontWeight.bold,
                      color: provider.themeMode == ThemeMode.light ? MyThemeData.blackColor : MyThemeData.yellowColor,),
                ),
                Divider(
                  thickness: 1,
                  color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor,
                  indent: 40,
                  endIndent: 40,
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Text(
                        "${Alhadeeth[index]}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.elMessiri(fontSize: 25,
                        color:  provider.themeMode == ThemeMode.light ? Colors.black : Color(0xFFFACC1D)),
                      );
                    },
                    itemCount: Alhadeeth.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
