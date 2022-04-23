import 'package:apma/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ExerciseTrack extends StatefulWidget {
  ExerciseTrack({Key? key}) : super(key: key);

  @override
  State<ExerciseTrack> createState() => _ExerciseTrackState();
}

class _ExerciseTrackState extends State<ExerciseTrack> {
  late String dropDownValue = 'None';
  CalendarFormat _calendarFormat = CalendarFormat.week;
  late double sliderValue = 0;
  var items = [
    "None",
    "1 time",
    "2 times",
    "3 times",
    "More than 3 times",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Energy'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TableCalendar(
                calendarFormat : _calendarFormat,
                firstDay: DateTime.utc(2020, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
              ),   
              const SizedBox(height: 30,),
              const Text("Type of Exercise."),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 24,
                  hint: const Text("Type of Exercise"),
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
              ),     
              const SizedBox(height: 30,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'How long did you do (in hours)?',
                ),
              ),
              const SizedBox(height: 30,),
              const Center(
                child: Text('Intensity of exercise performed.') ,
              ),
              Slider(
                min: 0,
                max: 10,
                divisions: 10,
                value: sliderValue,
                onChanged: (newValue) {
                  setState(() => sliderValue = newValue);
                },
              ),
              const SizedBox(height:40),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Describe How you feel after the exercise.',
                ),
              ),
              const SizedBox(height:40),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF671616),
                        onPrimary: Colors.white,
                        shadowColor: Colors.redAccent,
                        elevation: 3,
                        minimumSize: const Size(100, 50),
                      ),
                      child: const Text('Cancel'),
                      onPressed: (){
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF197B0C),
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        minimumSize: const Size(100, 50),
                      ),
                      child: const Text('Done'),
                      onPressed: (){
                      },
                    )
                  ]
                ),  
              ),
            ]
          )
        )
      )
    );
  }
}

