import 'package:apma/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Medicine {
  late String name;
  late String doseUnit;
  late String dosage;
  late DateTime expiryDate;
  late int frequency;

  Medicine(name, doseUnit, dose, date, freq){
    name = name;
    doseUnit = doseUnit;
    dosage = dose;
    expiryDate = date;
    frequency = freq;
  }
}


class MedicTrack extends StatefulWidget {
  MedicTrack({Key? key}) : super(key: key);

  @override
  State<MedicTrack> createState() => _MedicTrackState();
}

class _MedicTrackState extends State<MedicTrack> {

  Future<List<Medicine>> getAllMedicines() async{
    late List<Medicine> medicinesData = [];
    medicinesData.add(Medicine('Agomelatine', 'ml', 30, 2030/12/11, 3));
    medicinesData.add(Medicine('Aspirin', 'ml', 30, 2030/12/11, 3));
    medicinesData.add(Medicine('Botox', 'ml', 30, 2030/12/11, 3));
    medicinesData.add(Medicine('Amitriptyline', 'ml', 30, 2030/12/11, 3));
    medicinesData.add(Medicine('Baclofen', 'ml', 30, 2030/12/11, 3));
    return medicinesData;
  }
  late Future<List<Medicine>> medicines;
  TextEditingController dateinput = TextEditingController();
  String doseUnit = 'ml';  
  @override
  void initState() {
    super.initState();
    dateinput.text = ""; //set the initial value of text field
    medicines = getAllMedicines();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Medics'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                scrollable: true,
                title: const Text('Add Medicine'),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name of Medicine',
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'User Dosage',
                              ),
                            ),
                          ),
                          DropdownButton(
                            hint: const Text("Dose Unit"),
                            value: doseUnit,
                            items: ['gm','ml'].map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList() ,
                            onChanged:(String? doseUnitName){
                              setState(() {
                                doseUnit= doseUnitName!;
                              });
                            }
                          )
                        ],
                      ),
                      
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Frequency',
                        ),
                      ),
                      TextField(
                        controller: dateinput,
                        decoration: const InputDecoration( 
                          labelText: "Enter expiry Date" //label text of field
                        ),
                        readOnly: true, 
                        onTap: () async {
                          DateTime ?pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030)
                          );
                          if(pickedDate != null ){
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                              setState(() {
                                dateinput.text = formattedDate; //set output date to TextField value. 
                              });
                          }else{
                          }
                        },
                      ),
                    ]
                  ),
                ),
                actions: [
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
                ],
              );
            }
          );
        }
      ),
      body: FutureBuilder<List<Medicine>>(
        future: medicines,
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index){
                final currentMedic = snapshot.data![index];
                return ExpansionTile(
                  title: Text(currentMedic.name),
                  children: [
                    Text(currentMedic.dosage + currentMedic.doseUnit),
                    Text('${currentMedic.frequency}' + ' times'),
                    Text('${currentMedic.expiryDate}'),
                  ],
                );
              }
            );
          }
          else{
              return const Center(
                child:Text("No Medicine. Click 'Add' to add new")
              );
          }
        }
      )
    );                
  }
}

