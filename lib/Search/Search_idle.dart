import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:netflix/Search/title.dart';
import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/constants.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/fVpFOcQyHJM2di9upgSIwWD5wac.jpg';

class SearchIdleWidget extends StatelessWidget {
   SearchIdleWidget({Key? key,
  required this.items}) : super(key: key);

  List<NetflixModel>items;
// final controller = Get.put(NetflixCOntroller());
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const SearchTextTile(title: 'Top Searches'),
        Kheight,
        Expanded(

          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => Kheight,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final data = items[index];
             return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 60,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(Kbaseurl + data.image.toString()),
            ),
          ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data.title.toString(),style: TextStyle(color: Kwhitecolor, fontWeight: FontWeight.bold,fontSize: 16),),
        )),
  
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(CupertinoIcons.play_circle,size: 35,color: Colors.white,),
      )
      ],
             );
           
            })
        )
      ]
    );
  }}
           
            
            
          
            


// class TopSearchItemTile extends StatelessWidget {
//   const TopSearchItemTile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;
//     return 
//   }
// }
