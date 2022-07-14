import 'package:flutter/material.dart';
import 'package:netflix/FirstLaugh/FastLaugh.dart';
import 'package:netflix/Home/ScreenHome.dart';
import 'package:netflix/New%20&%20Hot/New_&_Hot.dart';
import 'package:netflix/Search/screen_search.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/widgets/screendownloads.dart';
import 'bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenNewandHot(),
    ScreenFirstlaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
