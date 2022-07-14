import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Home/widgets/custom_button_widgets.dart';
import 'package:netflix/core/constants.dart';

class BackgroundCard extends StatelessWidget {
  BackgroundCard({Key? key}) : super(key: key);

  //final List image = ["/4zLfBbGnuUBLbMVtagTZvzFwS8l.jpg"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://www.themoviedb.org/t/p/w1280/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg"),
              fit: BoxFit.fitHeight,
            ),
            color: Kwhitecolor,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              //<<<<<Buttons>>>>>//
              children: [
                const CustomButtonWidget(
                  icon: CupertinoIcons.add,
                  iconSize: 30,
                  title: "My List",
                  textSize: 16,
                  textColor: Kwhitecolor,
                ),
                _PlayButton(),
                const CustomButtonWidget(
                  icon: CupertinoIcons.info,
                  iconSize: 30,
                  title: "Info",
                  textSize: 16,
                  textColor: Kwhitecolor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //<<<<<Play>>>>>//
  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Kwhitecolor),
      ),
      icon: const Icon(
        CupertinoIcons.play_fill,
        color: Colors.black,
        size: 25,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}