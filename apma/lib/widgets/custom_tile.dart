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
    'Medications':MedicTrack(),
    'Energy': EnergyTrack(),
    'Exercise': ExerciseTrack(),
    'Sleep':SleepTrack(),
    'Food': FoodTrack(),
  };

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 15),
          child: InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => maptonavigation[title],
                ),
              );
            },
            child: Center(
              child: Container(
                child: Image.asset("assets/icons/$title.png", scale: 0.75,),
                width: 100,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  backgroundBlendMode: BlendMode.lighten,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        
        Text(
          title,
        ),
      ],
    );
  }
}
