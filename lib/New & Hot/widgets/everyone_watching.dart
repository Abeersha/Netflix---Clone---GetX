import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/constants.dart';

class Everyonee_Watching extends StatelessWidget {
    List<NetflixModel> items;
   Everyonee_Watching({Key? key,
   required this.items}) : super(key: key);
    final controller = Get.put(NetflixCOntroller());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(itemCount: items.length,
            itemBuilder: (context, index) {
              final data = items[index];
              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Kheight,
                     Text(
                        data.title.toString(),
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Kheight,
                       Text(
                         data.description.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      Kheight,
                     
                     
                    ],
                  ),
                   Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      Kbaseurl + data.image.toString()),
                                  fit: BoxFit.cover)),
        
                          height: 250,
                          // color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 68,
                              width: 110,
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                              data.title.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                                height: 68,
                                width: 160,
                                color: Colors.black,
                                child: Center(
                                  child: Padding(
                                    padding:  EdgeInsets.all(14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      
                                      children: [
                                        
                                        EveryonesIcons(
                                            icon: CupertinoIcons.paperplane,
                                            text: "Share"),
                                        EveryonesIcons(
                                            icon: CupertinoIcons.plus, text: "My List"),
                                        EveryonesIcons(
                                            icon: CupertinoIcons.play, text: "Play"),
                                      ],
                                    ),
                                  ),
                                ),)
                          ],
                        )
                   
                ],
              );
            }
          ),
        )
      ],
    );
  }

  Column EveryonesIcons({
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
