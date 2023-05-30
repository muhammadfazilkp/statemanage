import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifire = ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifire,
      builder: (context, int newIndx, _) {
        return BottomNavigationBar(
            currentIndex: newIndx,
            onTap: (index) {
              indexChangeNotifire.value = index;
            },
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundColor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'New&Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads'),
            ]);
      },
    );
  }
}
