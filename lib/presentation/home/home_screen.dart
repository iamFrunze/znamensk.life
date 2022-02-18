import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:znamensk/resources/images/home_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              HomeImages.shared.vk,
              width: 25,
            ),
            label: 'ВК',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              HomeImages.shared.social,
              width: 25,
            ),
            label: 'Инфраструктура',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              HomeImages.shared.user,
              width: 25,
            ),
            label: 'ЛК',
          )
        ],
        onTap: onTapHandler,
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget body(int index) {
    switch (index) {
      case 0:
        return const Center(
          child: Text("RSS"),
        );
      case 1:
        return const Center(
          child: Text("VK"),
        );
      case 2:
        return const Center(
          child: Text("Social"),
        );
      case 3:
        return const Center(
          child: Text("Account"),
        );
      default:
        return const Center(
          child: Text("Account"),
        );
    }
  }
}
