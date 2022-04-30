import 'package:apma/Boxes/boxes.dart';
import 'package:apma/models/pain_model.dart';
import 'package:apma/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class PainTrack extends StatefulWidget {
  PainTrack({Key? key}) : super(key: key);

  @override
  State<PainTrack> createState() => _PainTrackState();
}

class _PainTrackState extends State<PainTrack> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime? _selectedDay;
  late DateTime recordDate;
  late String dropDownValue = "Aching";
  late double sliderValue = 0;
  late bool checkboxListTileValue = false;
  var painIntensity = [
    "Little",
    "Very Mild",
    "Discomforting",
    "Tolerable",
    "Distressing",
    "Very Distressing",
    "Intense",
    "Very Intense",
    "Utterly Horrible",
    "Unbearable",
    "Horrendous"
  ];
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
  void initState() {
    super.initState();
    recordDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final _userEmail = Provider.of<String>(context, listen: false);
    final user = Boxes.getUsers().get(_userEmail);

    return Scaffold(
      appBar: showAppBar(context,'Pain'),
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
                focusedDay: recordDate,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      recordDate = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  recordDate = focusedDay;
                },
              ),
              const SizedBox(height: 30,),
              const Text("Select Pain Type"),      
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton(
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
              ),
              const SizedBox(height: 30,),
              const Center(
                child: Text('Intensity of Pain') ,
              ),
              Slider(
                label: painIntensity[sliderValue/10~/10],
                min: 0,
                max: 10,
                divisions: 10,
                value: sliderValue,
                onChanged: (newValue) {
                  setState(() => sliderValue = newValue);
                },
              ),
              const SizedBox(height:40),
              CheckboxListTile(
                value: checkboxListTileValue,
                onChanged: (newValue) => setState(() => checkboxListTileValue = newValue!),
                title:const  Text(
                  'Does the pain improve after Medication?',
                ),
                tileColor: const Color(0xFFF5F5F5),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
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
                        Pain painData = Pain(recordDate, dropDownValue, sliderValue,checkboxListTileValue);
                        if (user!=null){
                          user.pains.add(painData);
                        }
                      },
                    )
                  ]
                ),  
              ),
            ],
          ),
        ),
      ),
    );
  }
}

