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
    "Aching",
    "Burning",
    "Crawling",
    "Crushing",
    "Heaviness", 
    "Icy coldness", 
    "Intermittent",
    "Numbing" ,
    "Piercing" ,
    "Pounding", 
    "Pressure", 
    "Sharp", 
    "Shooting", 
    "Sore", 
    "Stabbing", 
    "Searing",
    "Tearing", 
    "Tenderness", 
    "Tightness",
    "Tingling" 
  ];
  String dropdownvalue= 'Aching';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Pain'),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height:30),
            
            Container(
              child: ElevatedButton(
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
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height:40),
            Container(
              child: Column(
                children: [
                  const Text(
                    'Select Pain Type',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  DropdownButton(
                    iconSize: 24,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down), 
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(), 
                    onChanged: (String? newValue){
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }
                  ),
                ],
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

