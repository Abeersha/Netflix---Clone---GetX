import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Search/controller/search_controller.dart';
import 'package:netflix/Search/search_idle.dart';
import 'package:netflix/Search/title.dart';
import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/constants.dart';

class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({Key? key}) : super(key: key);

  final controller = Get.put(SearchController());

  TextEditingController searchTextControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTile(title: 'Movies and Tv'),
        Kheight,
        Expanded(
          child: Obx(()
             {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 8,
                childAspectRatio: 1.2 / 1.4,
                children: List.generate(
                  controller.data.length,
                  (index) {
                    final data= controller.data[index];
                    final Image = Kbaseurl + data.image.toString();
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(Image  ), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    );
                  },
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}

// class MainCard extends StatelessWidget {

//    const MainCard({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
   
//    decoration: BoxDecoration(
//      image: DecorationImage(image: NetworkImage(imageUrl ),fit: BoxFit.cover),
//      borderRadius: BorderRadius.circular(7),
//    ),
      
//     );
  