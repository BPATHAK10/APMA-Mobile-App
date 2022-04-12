import 'package:apma/screens/exercise_screen.dart';
import 'package:apma/screens/food_track.dart';
import 'package:apma/screens/medication.dart';
import 'package:apma/screens/sleep_screen.dart';
import 'package:flutter/material.dart';
import 'package:apma/screens/pain_track_screen.dart';
import 'package:apma/screens/energy_screen.dart';

class CustomTile extends StatelessWidget {
 CustomTile({Key? key, required this.title}) : super(key: key);

  final String title;
  Map<String, dynamic> maptonavigation = {
    'Pain': PainTrack(),
    'Energy': EnergyTrack(),
    'Exercise': ExerciseScreen(),
    'Sleep':SleepScreen(),
    'Medications':MedicTrack(),
    'Food': FoodTrack(),
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
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
