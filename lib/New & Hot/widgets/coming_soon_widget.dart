import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:netflix/api/controller/netflix_controller.dart';
import 'package:netflix/api/model/netflix_model.dart';

import '../../Home/widgets/custom_button_widgets.dart';
import '../../core/constants.dart';

class ComingSoonwidget extends StatelessWidget {
  List<NetflixModel> items;

  ComingSoonwidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  final controller = Get.put(NetflixCOntroller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final data = items[index];
        //Kheight,
        return Row(
          children: [
            SizedBox(
              width: 50,
              height: 480,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "FEB",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "11",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - 50,
              height: 480,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(
                          Kbaseurl + data.image.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent.withOpacity(0.6),
                          radius: 20,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.speaker_slash,
                              size: 20,
                              color: Kwhitecolor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Kheight15,
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 80,
                          child: Text(
                            data.title.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Spacer(),
                        CustomButtonWidget(
                          icon: CupertinoIcons.bell,
                          title: "Remind Me",
                          iconSize: 20,
                          textSize: 14,
                          textColor: Colors.grey,
                        ),
                        Kwidth10,
                        CustomButtonWidget(
                          icon: CupertinoIcons.info,
                          title: "info",
                          iconSize: 20,
                          textSize: 14,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Kheight,
                  Text(
                    data.date.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Kheight,
                  Text(
                    data.title.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Kheight,
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      data.description.toString(),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
