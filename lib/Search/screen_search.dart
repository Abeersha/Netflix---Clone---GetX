import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:netflix/Search/controller/search_controller.dart';
import 'package:netflix/Search/search_idle.dart';
import 'package:netflix/Search/search_results.dart';
import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/core/constants.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w1280/20L6Fq9nBgiIx34VERoaEcjvJJf.jpg';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  TextEditingController textEditingController = TextEditingController();

  NetflixCOntroller controller = Get.put(NetflixCOntroller());
  final searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CupertinoSearchTextField(
        onChanged: (value) {
          searchController.putData(value.toString());
        },
        controller: textEditingController,
        prefixIcon: const Icon(
          CupertinoIcons.search,
          color: Color.fromARGB(255, 131, 124, 124),
        ),
        suffixIcon: const Icon(
          CupertinoIcons.xmark_circle_fill,
          color: Colors.grey,
        ),
        style: const TextStyle(color: Colors.white),
      ),
      Kheight,
      Kheight,
      Obx(() {
        //  if(textEditingController.text.isEmpty) {
        //    searchController.putData('tv & movies');
        //  }

        return Expanded(
            child: searchController.data.isEmpty
                ? SearchIdleWidget(items: controller.popular)
                : SearchResultWidget());
      })
    ])));

    //  Expanded(child: SearchResultWidget())
  }
}
