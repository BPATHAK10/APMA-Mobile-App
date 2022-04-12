import 'package:flutter/material.dart';
import 'package:apma/widgets/appbar.dart';
import 'package:apma/widgets/drawer.dart';
import 'package:apma/widgets/custom_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    'Home',
    'Notifications',
    'Profile'
  ];
  final List<Widget> screenPages = [
    GridView.count(
      padding: const EdgeInsets.all(25),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: <Widget>[
        CustomTile(title: "Pain",),
        CustomTile(title: "Energy",),
        CustomTile(title: "Exercise",),
        CustomTile(title: "Sleep",),
        CustomTile(title: "Medications"),
        CustomTile(title: "Food"),
      ],
    ),
    const Center(
      child: Icon(
        Icons.call,
        size: 150,
      ),
    ),
    const Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
  ];
  int selectedState = 0;

  void changeTab(int index) {
    setState(() => selectedState = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,screens[selectedState]),
      drawer: showDrawer(context),
      bottomNavigationBar:
          BottomNavigationBar(
            currentIndex: selectedState,
            onTap: (index) => changeTab(index),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            iconSize: 20,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: screens[0],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: screens[1]
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: screens[2]
              ),
            ],
      ),
      body: IndexedStack(
        index: selectedState,
        children: screenPages,
      ),
    );
  }
}
