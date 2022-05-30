import 'package:apma/screens/home_tab.dart';
import 'package:apma/screens/notification_tab.dart';
import 'package:apma/screens/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:apma/widgets/custom_appbar.dart';
import 'package:apma/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabs = [
    'Home',
    'Notifications',
    'Profile'
  ];
  final List<Widget> tabPages = [
    HomeTab(),
    NotificationTab(),
    ProfileTab(),
  ];
  int selectedState = 0;

  void changeTab(int index) {
    setState(() => selectedState = index);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: showAppBar(context,tabs[selectedState]),
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
                label: tabs[0],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: tabs[1]
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: tabs[2]
              ),
            ],
      ),
      body: IndexedStack(
        index: selectedState,
        children: tabPages,
      ),
    );
  }
}
