import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Home/widgets/custom_button_widgets.dart';
import 'package:netflix/New%20&%20Hot/widgets/coming_soon_widget.dart';
import 'package:netflix/New%20&%20Hot/widgets/everyone_watching.dart';

import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/core/constants.dart';

class ScreenNewandHot extends StatelessWidget {
   ScreenNewandHot({Key? key}) : super(key: key);

  NetflixCOntroller comingsooncontroller = Get.put(NetflixCOntroller());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              title: const Text("New and Hot",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  )),
              actions: [
                const Icon(Icons.cast, color: Colors.white, size: 30),
                Kwidth,
                Container(
                  width: 30,
                  height: 30,
                  // color: Colors.blue,
                  decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/smiley.png'),
                  fit: BoxFit.cover,




                ))
                )
              ],
              bottom: TabBar(
                  unselectedLabelColor: Kwhitecolor,
                  labelColor: KBlackColor,
                  labelStyle:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: Kwhitecolor,
                      borderRadius: BorderRadius.circular(30)),
                  tabs: const [
                    Tab(
                      text: "🍿Coming Soon",
                    ),
                    Tab(
                      text: "👀Everyone's watching",
                    )
                  ]),
            )),
        body: TabBarView(
          children: [
            ComingSoonwidget(items: comingsooncontroller.released,),
           Everyonee_Watching(items: comingsooncontroller.released),
          ],
        ),
      ),
    );
  }
}

