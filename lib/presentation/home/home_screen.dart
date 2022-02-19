import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'ВК',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Афиша",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Инфраструктура',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
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
