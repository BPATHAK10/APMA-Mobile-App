import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: const Text('Home'),
        ),
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: const Text('Drawer Header'),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
            // Container(
            //   child: Text("item 1"),
            // ),
            //    Container(
            //   child: Text("item 2"),
            // ),
            // Container(
            //   child: Text("item 3"),
            // ),
            // Container(
            //   child: Text("item 4"),
            // ),
          ],
        ));
  }
}
