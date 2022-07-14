
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:netflix/Home/widgets/main_title.dart';
import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/constants.dart';

class ReleasedInThePastYear extends StatelessWidget {
  final String title;
  final IconData? icon;

  ReleasedInThePastYear({
    Key? key,
    required this.title,
     required this.items,
    this.icon,
  }) : super(key: key);

   List<NetflixModel> items;

  final controller = Get.put(NetflixCOntroller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          Kheight,
          LimitedBox(
            maxHeight: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) {
                   final data = items[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(Kbaseurl+data.image.toString(),
                              
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(icon),
                              color: Kwhitecolor,
                              iconSize: 60,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey[600],
                          height: 40,
                          width: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.info_outline,
                                color: Kwhitecolor,
                                size: 30,
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Kwhitecolor,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
