import 'package:flutter/material.dart';
import 'package:apma/widgets/appbar.dart';
import 'package:apma/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar('Home'),
      drawer: showDrawer(context),
      body:Container(
        child: Column(
          children: [
            const SizedBox(height:100),
            const Text('HomeScreen'),
          ],
        )
      ),
    );
  }
}