import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session_8_flutter4/models/hadeethModel.dart';

class HadeethDetails extends StatelessWidget {
  static const String routeName = "hadeethDetails";
  const HadeethDetails({super.key}); 

  @override
  Widget build(BuildContext context) {
    var hadeethModel =
        ModalRoute.of(context)!.settings.arguments as HadeethModel;
    List<String> Alhadeeth = hadeethModel.content;

    return Container(
      decoration: const BoxDecoration(
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
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              children: [
                Text(
                  "${hadeethModel.title}",
                  style: GoogleFonts.elMessiri(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xFFB7935F),
                  indent: 40,
                  endIndent: 40,
                ),
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
                        style: GoogleFonts.elMessiri(fontSize: 25),
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
