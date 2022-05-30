import 'package:apma/models/energy_model.dart';
import 'package:apma/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:apma/Boxes/boxes.dart';
import 'package:provider/provider.dart';

class EnergyTrack extends StatefulWidget {
  EnergyTrack({Key? key}) : super(key: key);

  @override
  State<EnergyTrack> createState() => _EnergyTrackState();
}

class _EnergyTrackState extends State<EnergyTrack> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  late double sliderValue = 0;
  late String mood = '';
  
  late DateTime recordDate;
  DateTime? _selectedDay;
  

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
                focusedDay: recordDate,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
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
                onPageChanged: (focusedDay) {
                  recordDate = focusedDay;
                },
              ),            
              const SizedBox(height: 30,),
              const Center(
                child: Text('Intensity of Energy') ,
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
                  labelText: 'Describe Your Energy and Mood.',
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
                      onPressed: () async{
                        Energy energyData = Energy(recordDate, sliderValue, mood);
                        if (user!=null){
                          user.energy.add(energyData);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Energy Data Added',
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Couldn't add data.",
                              ),
                            ),
                          );
                        }
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

