import 'package:flutter/material.dart';
import 'package:apma/screens/pain_track_screen.dart';
import 'package:apma/screens/energy_screen.dart';

class MyTile extends StatelessWidget {
  MyTile({Key? key, required this.title}) : super(key: key);

  final String title;
  Map<String, dynamic> maptonavigation = {
    'Pain': PainTrack(),
    'Energy Level': EnergyTrack(),
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=> maptonavigation[title])
        );
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
           BoxShadow(
            color: Colors.grey.shade600,
            blurRadius: 10.0,
          ),
        ]),
        child: Card(
          shadowColor: Colors.black,
          color: Colors.blueAccent,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Text(
              title,
              style: TextStyle(fontSize: 25),
            )),
          ),
        ),
      ),
    );
  }
}
