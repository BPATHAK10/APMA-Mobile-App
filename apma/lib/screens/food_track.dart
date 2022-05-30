import 'package:apma/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class FoodTrack extends StatefulWidget {
  FoodTrack({Key? key}) : super(key: key);

  @override
  State<FoodTrack> createState() => _FoodTrackState();
}

class _FoodTrackState extends State<FoodTrack> {
  late String whomDropDownValue = 'Alone';
  late String moodDropDownValue = 'Happy';
  late String symptomDropDownValue = 'None';
  CalendarFormat _calendarFormat = CalendarFormat.week;
  late String _selectedTime = '';
  late double hungerBeforeSliderValue = 0;
  late double hungerAfterSliderValue = 0;
  late double sliderValue = 0;
  var whomItems = [
    "Alone",
    "Colleagues",
    "Family",
    "Friends",
  ];
  var moodItems = [
    "Angry",
    "Bored",
    "Depressed",
    "Happy",
    "Neutral",
    "Rushed",
    "Tend",
    "Tired",
  ];
  var symptomItems = [
    "None",
    "Anxiety",
    "Asthma",
    "Bloating",
    "Constipation",
    "Diarrhea",
    "Eczema",
    "Fatigue",
    "Flushing skin", 
    "Gas",
    "Hay Fever",
    "Headache",
    "Heartburn",
    "Hives",
    "Indigestion",
    "Insomnia",
    "Jitters",
    "Joint pain",
    "Mouth Ulcers",
    "Nausea",
    "Nervousness",
    "Rapid heartbeat",
    "Rash",
    "Reflux",  
    "Restlessness",
    "Sinus",
    "Stomach upset",
    "Vomiting",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Food'),
      body:SingleChildScrollView(
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
              const SizedBox(height:40),
              const Text("With whom did you eat?"),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 24,
                  hint: const Text("With whom did you eat?"),
                  value: whomDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down), 
                  items: whomItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), 
                  onChanged: (String? newValue){
                    setState(() {
                      whomDropDownValue = newValue!;
                    });
                  }
                ),
              ),
              const SizedBox(height:40),
              const Text("Mood Prior Eating"),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 24,
                  hint: const Text("Mood Prior eating"),
                  value: moodDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down), 
                  items: moodItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), 
                  onChanged: (String? newValue){
                    setState(() {
                      moodDropDownValue = newValue!;
                    });
                  }
                ),
              ),
              const SizedBox(height: 30,),
              const Center(
                child: Text('Huger Level') ,
              ),
              Slider(
                min: 0,
                max: 3,
                divisions: 3,
                value: hungerBeforeSliderValue,
                onChanged: (newValue) {
                  setState(() => hungerBeforeSliderValue = newValue);
                },
              ),
              const SizedBox(height:40),

              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'What food did you eat',
                ),
              ),
              const SizedBox(height:20),
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'What drinks did you consume',
                ),
              ),
              const SizedBox(height: 30,),
              const Center(
                child: Text('Fullness Level') ,
              ),
              Slider(
                min: 0,
                max: 3,
                divisions: 3,
                value: hungerAfterSliderValue,
                onChanged: (newValue) {
                  setState(() => hungerAfterSliderValue = newValue);
                },
              ),
              const SizedBox(height:40),
              const Text("Symptoms After Eating"),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 24,
                  hint: const Text("Symptoms After eating"),
                  value: symptomDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down), 
                  items: symptomItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), 
                  onChanged: (String? newValue){
                    setState(() {
                      symptomDropDownValue = newValue!;
                    });
                  }
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

