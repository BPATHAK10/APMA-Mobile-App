import 'package:apma/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:apma/constants.dart';


class ExerciseTrack extends StatefulWidget {
  ExerciseTrack({Key? key}) : super(key: key);

  @override
  State<ExerciseTrack> createState() => _ExerciseTrackState();
}

class _ExerciseTrackState extends State<ExerciseTrack> {
  late String moveDropDownValue = 'Walking';
  late String moodAfterDropDownValue = 'Happy';
  late String moodBeforeDropDownValue = 'Angry';
  late String timeDropDownValue = '< 10 minutes';
  CalendarFormat _calendarFormat = CalendarFormat.week;
  late double painBeforeSliderValue = 0;
  late double painAfterSliderValue = 0;
  late String _selectedTime = '';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Movement'),
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
              ElevatedButton(
                onPressed: () async{
                  final TimeOfDay? result =
                  await showTimePicker(context: context, initialTime: TimeOfDay.now());
                  if (result != null) {
                    setState(() {
                      _selectedTime = result.format(context);
                    });
                  }
                }, 
                child: const Text('Show Time Picker')
              ),
              const SizedBox(height: 30,),
              const Text("Type of Movement."),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 24,
                  hint: const Text("Type of Movement"),
                  value: moveDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down), 
                  items: moveItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), 
                  onChanged: (String? newValue){
                    setState(() {
                      moveDropDownValue = newValue!;
                    });
                  }
                ),
              ), 
              const SizedBox(height: 30,),
              const Text("Mood Before Moving"),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 24,
                  hint: const Text("Prior Mood"),
                  value: moodBeforeDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down), 
                  items: moodItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), 
                  onChanged: (String? newValue){
                    setState(() {
                      moodBeforeDropDownValue = newValue!;
                    });
                  }
                ),
              ),
              const SizedBox(height: 30,),
              const Text("Mood After Moving"),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 24,
                  hint: const Text("Post Move Mood"),
                  value: moodAfterDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down), 
                  items: moodItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), 
                  onChanged: (String? newValue){
                    setState(() {
                      moodAfterDropDownValue = newValue!;
                    });
                  }
                ),
              ),
              const SizedBox(height: 30,),
              const Text("How long did you do?"),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 24,
                  hint: const Text("Time spent"),
                  value: timeDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down), 
                  items: timeItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), 
                  onChanged: (String? newValue){
                    setState(() {
                      timeDropDownValue = newValue!;
                    });
                  }
                ),
              ),    
              const SizedBox(height: 30,),
              const Center(
                child: Text('Pain before moving') ,
              ),
              Slider(
                min: 0,
                max: 10,
                divisions: 10,
                value: painBeforeSliderValue,
                onChanged: (newValue) {
                  setState(() => painBeforeSliderValue = newValue);
                },
              ),
              const SizedBox(height: 30,),
              const Center(
                child: Text('Pain after moving') ,
              ),
              Slider(
                min: 0,
                max: 10,
                divisions: 10,
                value: painAfterSliderValue,
                onChanged: (newValue) {
                  setState(() => painAfterSliderValue = newValue);
                },
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

