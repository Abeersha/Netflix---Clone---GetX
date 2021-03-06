import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/instance_manager.dart';
import 'package:netflix/Home/widgets/main_home_title_card.dart';
import 'package:netflix/core/constants.dart';

import '../api/controller/netflix_controller.dart';
import 'widgets/background_card.dart';
import 'widgets/number_title_card.dart';
import 'widgets/released_in_pastyear.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  NetflixCOntroller controller = Get.put(NetflixCOntroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroundCard(),
                    ReleasedInThePastYear(items: controller.trending,
                      title: "Released in the Past Year",
                      icon: CupertinoIcons.play_circle,
                    ),
                    MainHomeTitleCard(items: controller.tvandMovies,
                      title: "Trending Now",
                    ),
                    NumberTitleCard(
                      items: controller.popular,

                      title: "Top 10 TV Shows In India Today",
                      //items: netflixController.topRated,
                    ),
                    MainHomeTitleCard(
                      title: "Tense Dramas", items: controller.newMovies,
                    ),
                    MainHomeTitleCard(
                      title: "South Indian Cinemas", items: controller.trending,
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(
                          seconds: 2,
                        ),
                        curve: Curves.fastOutSlowIn,
                        width: double.infinity,
                        height: 80,
                        color: Colors.transparent.withOpacity(.4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Kwidth,
                                SizedBox(
                                  width: 28,
                                  height: 50,
                                  child: Image.asset(
                                    "assets/netflixlogo.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Kwidth,
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                    "assets/smiley.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Kwidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: KHomeTitleText,
                                ),
                                Text(
                                  "Movies",
                                  style: KHomeTitleText,
                                ),
                                LimitedBox(
                                  child: GestureDetector(
                                    onTap: () {
                                      _showCategoriesList(context);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Categories",
                                          style: KHomeTitleText,
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: Kwhitecolor,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : Kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Categories_List>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
Future<Object?> _showCategoriesList(BuildContext context) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      body: Column(
        children: const [
          SizedBox(height: 50),
          CategoriesListWidget(),
          SizedBox(height: 20),
          ClossButtonWidget(),
          SizedBox(height: 30)
        ],
      ),
    ),
  );
}

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext _context, int _index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                homeCategories[_index],
                style: KHomeTitleText,
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext _cx, int _indx) {
          return const SizedBox(height: 35);
        },
        itemCount: 20,
      ),
    );
  }
}

class ClossButtonWidget extends StatelessWidget {
  const ClossButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close),
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      radius: 25,
    );
  }
}

List<String> homeCategories = [
  'Home',
  'My List',
  'Available for Download',
  'Hindi',
  'Tamil',
  'Punjabi',
  'Telugu',
  'Malayalam',
  'Marathi',
  'Bengali',
  'English',
  'Action',
  'Anime',
  'Award Winners',
  'Biographical',
  'Blockbusters',
  'Bollywood',
  'Children & Family',
  'Comedies',
  'Documentaries',
  'Dramas',
  'Fantasy',
  'Hollywood',
  'Hurror',
  'International',
  'Indian'
];
