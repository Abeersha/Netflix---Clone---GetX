import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/FirstLaugh/widgets/video_list_item.dart';
import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/core/colors/colors.dart';

class ScreenFirstlaugh extends StatelessWidget {
  const ScreenFirstlaugh({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    NetflixCOntroller controller = Get.put(NetflixCOntroller());
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(10, (index) { 
          return VideoListItem(index: index,items: controller.topRated,);
        }),
      ),
      ),
    );
  }
}