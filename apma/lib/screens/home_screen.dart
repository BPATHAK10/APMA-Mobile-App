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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Home'),
      drawer: showDrawer(context),
      bottomNavigationBar:
          BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/reports.png', width: 30, height: 30),
                label: "Reports",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/resources.png', width: 30, height: 30,),
                label: "Resources"
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/journal.png', width: 30, height: 30),
                label: "Journal"
              ),
            ],
      ),
      
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const MyTile(
            title: "Pain",
          ),
          const MyTile(
            title: "Energy Level",
          ),
          const MyTile(
            title: "Exercise",
          ),
          const MyTile(
            title: "Sleep",
          ),
          const MyTile(title: "Work"),
          const MyTile(title: "Toolkit"),
          
        ],
      )
    );
  }
}
