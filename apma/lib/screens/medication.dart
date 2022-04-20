import 'package:apma/widgets/appbar.dart';
import 'package:apma/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MedicTrack extends StatefulWidget {
  MedicTrack({Key? key}) : super(key: key);

  @override
  State<MedicTrack> createState() => _MedicTrackState();
}

class _MedicTrackState extends State<MedicTrack> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Medications'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                scrollable: true,
                title: const Text('Login'),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        // TableCalendar(
                        //   calendarFormat : CalendarFormat.week,
                        //   firstDay: DateTime.utc(2020, 10, 16),
                        //   lastDay: DateTime.utc(2030, 3, 14),
                        //   focusedDay: DateTime.now(),
                        // ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Name of Medicine',
                            icon: Icon(Icons.account_box),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'User Dosage',
                            icon: Icon(Icons.email),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Frequency',
                            icon: Icon(Icons.email),
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () {
                      
                    }
                  ),
                  ElevatedButton(
                    onPressed: (){

                    },
                    child: const Text("Cancel")
                  )
                ],
              );
            }
          );
        }
      ),
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

