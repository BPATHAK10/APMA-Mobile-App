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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
        child: GridView(
          controller: ScrollController(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          // scrollDirection: Axis.vertical,
          children: [
            CustomTile(title: "Pain"),
            CustomTile(title: "Medications"),
            CustomTile(title: "Energy",),
            CustomTile(title: "Food"),
            CustomTile(title: "Movement",),
            CustomTile(title: "Sleep",),
          ],
        )
      )
        
    );
  }
}