import 'package:apma/widgets/appbar.dart';
import 'package:apma/widgets/button.dart';
import 'package:flutter/material.dart';

class PainTrack extends StatefulWidget {
  PainTrack({Key? key}) : super(key: key);

  @override
  State<PainTrack> createState() => _PainTrackState();
}

class _PainTrackState extends State<PainTrack> {
  late DateTimeRange calendarSelectedDay;
  late String radioButtonValue;
  late String dropDownValue = "Aching";
  late double sliderValue;
  late bool checkboxListTileValue;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Pain'),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height:30),
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
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),            
            DropdownButton(
              isExpanded: true,
              iconSize: 24,
              hint: const Text("Select Pain Type"),
              value: dropDownValue,
              icon: const Icon(Icons.keyboard_arrow_down), 
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(), 
              onChanged: (String? newValue){
                setState(() {
                  dropDownValue = newValue!;
                });
              }
            ),
            Slider(
              min: 0,
              max: 10,
              value: sliderValue ??= 0,
              onChanged: (newValue) {
                setState(() => sliderValue = newValue);
              },
            ),
            const SizedBox(height:40),
            CheckboxListTile(
              value: checkboxListTileValue ??= true,
              onChanged: (newValue) => setState(() => checkboxListTileValue = newValue!),
              title:const  Text(
                'Does the pain improve after Medication?',
              ),
              tileColor: const Color(0xFFF5F5F5),
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            buttonRow(context),
          ],
        ),
      ),
    );
  }
}

