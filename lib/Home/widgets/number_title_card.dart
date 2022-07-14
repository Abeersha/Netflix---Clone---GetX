import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Home/widgets/main_title.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import '../../api/controller/netflix_controller.dart';

class NumberTitleCard extends StatelessWidget {

  NumberTitleCard({
    Key? key,
    required this.items,
    required this.title,
  }) : super(key: key);


   List<NetflixModel> items;
final controller = Get.put(NetflixCOntroller());
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          Kheight,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
             10,
                (index) {
                   final data = items[index];
                  return Stack(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 35,
                            height: 200,
                          ),
                          Container(
                            width: 110,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: kRadius10,
                              color: Colors.purpleAccent,
                              image: DecorationImage(
                                image: NetworkImage(
                                    
            Kbaseurl + data.image.toString(),
      

                                    ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        bottom: -24,
                        child: BorderedText(
                          strokeWidth: 6.0,
                          strokeColor: KWhiteColor,
                          child: Text(
                            "${index + 1}",
                            style: GoogleFonts.workSans(
                                fontSize: 125,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
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
