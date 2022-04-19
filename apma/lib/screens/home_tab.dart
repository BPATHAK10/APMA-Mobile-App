import 'package:flutter/material.dart';
import 'package:apma/widgets/custom_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    return 
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
    );
  }
}