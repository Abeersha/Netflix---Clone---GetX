import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  String title;
   AppBarWidget({ Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(child: Text(title,style: GoogleFonts.montserrat(fontSize: 30,fontWeight: FontWeight.bold),)),
        const Spacer(),
        const Icon(Icons.cast,
        color: Colors.white,size: 30) ,
       Kwidth,

        Container(
          width: 25,
          height: 25,
          // color: Colors.blue,
         
 decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/smiley.png'),
                  fit: BoxFit.cover,




                ))
                
        ),
     ],
      
    );
  }
}