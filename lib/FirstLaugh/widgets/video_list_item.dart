import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/constants.dart';

class VideoListItem extends StatelessWidget {
  final int index;
   List<NetflixModel>items;
  
   VideoListItem({Key? key, required this.index, required this.items}) : super(key: key);
  NetflixCOntroller comingsooncontroller = Get.put(NetflixCOntroller());

  @override
  Widget build(BuildContext context) {
     
  final data = items[index];
    return Stack(children: [
      Container(
        
        decoration: BoxDecoration(
          
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(Kbaseurl+data.image.toString()))
        ),
        
        // color: Colors.accents[index % Colors.accents.length],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //LeftSide

              CircleAvatar(
                backgroundColor: Colors.black54.withOpacity(0),
               
                  radius: 30,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.volume_off_rounded,
                        size: 25,
                      )
                      )
                      ),
// RightSide

Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  CircleAvatar(radius: 30, backgroundImage: NetworkImage(Kbaseurl+data.image.toString()),),
  Kheight,
  VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL', ),
   VideoActionWidget(icon: CupertinoIcons.add,title: 'My List'),
    VideoActionWidget(icon: CupertinoIcons.paperplane, title: 'Share'),
     VideoActionWidget(icon: CupertinoIcons.play_fill, title: 'Play')


],)

            ],
          ),
        ),
      )
    ]);
  }
}


class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({ Key? key,
  required this.icon,
  required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10),
      child: Column(
        children: [
          Icon(icon,size: 30,color: Colors.white,),
          Text(title),
          
        ],
        
      ),
    );
  }
}