import 'package:apma/widgets/appbar.dart';
import 'package:apma/widgets/button.dart';
import 'package:flutter/material.dart';

class PainTrack extends StatefulWidget {
  PainTrack({Key? key}) : super(key: key);

  @override
  State<PainTrack> createState() => _PainTrackState();
}

class _PainTrackState extends State<PainTrack> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue= 'Item 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Energy Track'),
      body: Container(
        child: Column(
          children: [
            const Text('Track Energy Levels'),
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
            buttonRow(),
          ],
        ),
      ),
    );
  }
}

