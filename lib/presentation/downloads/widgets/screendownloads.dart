import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/app_bar_widgets.dart';

final List imageList = [
  "https://www.themoviedb.org/t/p/w1280/ekZobS8isE6mA53RAiGDG93hBxL.jpg",
  "https://www.themoviedb.org/t/p/w1280/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
  "https://www.themoviedb.org/t/p/w1280/20L6Fq9nBgiIx34VERoaEcjvJJf.jpg",
];

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar:  PreferredSize(
            child: AppBarWidget(title:"Downloads"), preferredSize:  Size.fromHeight(50)),
        backgroundColor: backgroundColor,
        body:  ListView(
          children: [
            Row(
              children: const [
                Icon(
                  Icons.settings,
                  color: Kwhitecolor,
                ),
                Kwidth,
                Text(
                  "Smart Downloads",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(height: size.height* 0.06),
            const Center(
              child: Text(
                "Introducing Downloads for you",
                style: TextStyle(
                    color: Kwhitecolor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                "We'll download a personalised selection of\n movies and shows for you, So there's always\n \t\t\tsomething to watch on your device",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height*.34,
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                 CircleAvatar(
                    radius: size.width * .30,
                    backgroundColor: Colors.grey.shade700,
                  ),
                  DownloadsImageWIdget( 
                    angle: 20,
                    imageList: imageList[0],
                    margin: EdgeInsets.only(left: 140,bottom: 40),
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  DownloadsImageWIdget(
                    angle: -20,
                    imageList: imageList[1],
                    margin: const EdgeInsets.only(right: 140,bottom: 40),
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  DownloadsImageWIdget(
                    angle: 0,
                    imageList: imageList[2],
                    margin: EdgeInsets.only(left: 0),
                    height: MediaQuery.of(context).size.height * 0.24,
                  )
                ],
              ),
            ),
          SizedBox(height: size.height* 0.06),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MaterialButton(
                color: KButtonColorBlue,
                onPressed: () {},
                child: const Text(
                  "Setup",
                  style: TextStyle(
                    color: Kwhitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                  onPressed: () {},
                  color: KButtonColorWhite,
                  child: Text(
                    "See what you can download",
                    style: TextStyle(
                        color: KBlackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }
}

class DownloadsImageWIdget extends StatelessWidget {
  DownloadsImageWIdget(
      {Key? key,
      required this.imageList,
      required this.angle,
      required this.height,
      required this.margin})
      : super(key: key);

  final String imageList;
  final EdgeInsets margin;
  final double angle;
  final double height ;
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.28,
        height: height,
        // child: ClipRRect(borderRadius: BorderRadius.circular(15),
        // child: SizedBox.fromSize(
        //   size:  Size.fromRadius(15),
        //   child: Image.network(imageList),
          
        // ),),
        decoration: BoxDecoration(
            color: KBlackColor,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
            fit: BoxFit.cover,
                image: NetworkImage(
              imageList,
            ))),
      ),
    );
  }
}

