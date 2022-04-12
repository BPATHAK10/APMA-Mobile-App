import 'package:apma/widgets/appbar.dart';
import 'package:apma/widgets/button.dart';
import 'package:flutter/material.dart';

class EnergyTrack extends StatefulWidget {
  EnergyTrack({Key? key}) : super(key: key);

  @override
  State<EnergyTrack> createState() => _EnergyTrackState();
}

class _EnergyTrackState extends State<EnergyTrack> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Energy'),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2030),
                );
              },
              child: const Text(
                'Select Date',
              ),
            ),
            const SizedBox(height:40),
            Slider(
              onChanged: (double val){
              },
              value: 30,
              max: 100,
              min: 0,
            ),
            const SizedBox(height:40),
            buttonRow(context),
          ],
        ),
      ),
    );
  }
}

