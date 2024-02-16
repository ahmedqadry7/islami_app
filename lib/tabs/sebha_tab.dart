import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 50),
            child: Image.asset("assets/images/sebha_head.png"),
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
            child: Image.asset("assets/images/sebha_body.png")),
          SizedBox(height: 35),
          Text(
            "عدد التسبيحات",
            style: GoogleFonts.elMessiri(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFC9B496),
                borderRadius: BorderRadius.circular(25)),
            width: 69,
            height: 81,
            child: Center(
              child: Text(
                counter.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 137,
            height: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color(0xFFB7935F),
            ),
            child: Center(
                child: Text(
              azkar[index],
              style: GoogleFonts.elMessiri(
                fontSize: 25,
                color: Colors.white
              ),
            )),
          )
        ],
      ),
    );
  }
}
