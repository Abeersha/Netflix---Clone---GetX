import 'package:flutter/material.dart';


ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(

      
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          //print('rendering');

          return BottomNavigationBar(
            
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            elevation: 0,
            items: const [

      BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.collections),label: 'New & Hot'),
      BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions,),label: 'Fast Laughs'),
      BottomNavigationBarItem(icon: Icon(Icons.search,),label: 'search'),
      BottomNavigationBarItem(icon: Icon(Icons.arrow_drop_down_circle_rounded,),label: 'Downloads'),
             
            ],
          );
        });
  }
}
