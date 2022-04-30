import 'package:apma/models/medicine_model.dart';
import 'package:apma/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:apma/Boxes/boxes.dart';

class MedicTrack extends StatefulWidget {
  MedicTrack({Key? key}) : super(key: key);

  @override
  State<MedicTrack> createState() => _MedicTrackState();
}

class _MedicTrackState extends State<MedicTrack> {
  final _formKey = GlobalKey<FormState>();
  List<Medicine> medicines = [];
  TextEditingController dateinput = TextEditingController();
  DateTime expireDate = DateTime.now();
  String doseUnit = 'ml';  
  int frequency = 1;
  double dose = 0;
  String name = "Dummy";

  @override
  void initState() {
    super.initState();
    dateinput.text = ""; 
    medicines.add(Medicine('Agomelatine', 'ml', 30, DateTime(2030,12,11), 3));
    medicines.add(Medicine('Aspirin', 'ml', 30, DateTime(2030,12,11), 3));
    medicines.add(Medicine('Botox', 'ml', 30, DateTime(2030,12,11), 3));
    medicines.add(Medicine('Amitriptyline', 'ml', 30, DateTime(2030,12,11), 3));
    medicines.add(Medicine('Baclofen', 'ml', 30, DateTime(2030,12,11), 3));
  }
  
  @override
  Widget build(BuildContext context) {
    final _userEmail = Provider.of<String>(context, listen: false);
    final user = Boxes.getUsers().get(_userEmail);

    print(user?.medicines.length);
    if (user!=null){
      user.medicines.forEach((element) {
        var newMedicine = Medicine(element.name,"ml",element.dosage,element.expiryDate,element.frequency);
        setState(() {
          medicines.add(newMedicine);
        });
      });
    }

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Name of Medicine',
                          ),
                          onChanged: (text){
                            name = text;
                          },
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'User Dosage',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value){
                                  dose = double.parse(value);
                                },
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
                          keyboardType: TextInputType.number,
                          onChanged: (value){
                            frequency = int.parse(value);
                          },
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
                                  expireDate = pickedDate;
                                  dateinput.text = formattedDate; //set output date to TextField value. 
                                });
                            }else{
                            }
                          },
                        ),
                      ]
                    ),
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
                      Navigator.pop(context);
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
                      Medicine medication = Medicine(name,"ml",dose,expireDate,frequency);
                      setState(() {
                        medicines.add(medication);
                        user!.medicines.add(medication);
                        user.save();
                      });
                      print (user?.medicines.length);
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            }
          );
        }
      ),
      body: (medicines.isNotEmpty)?
        ListView.builder(
          itemCount: medicines.length,
          itemBuilder: (BuildContext context, int index){
            final currentMedic = medicines[index];
            return ExpansionTile(
              title: Text(currentMedic.name),
              children: [
                Text('${currentMedic.dosage}' + currentMedic.doseUnit),
                Text('${currentMedic.frequency}' + ' times'),
                Text('${currentMedic.expiryDate}'),
              ],
            );
          }
        ): 
        const Center(
          child:Text("No Medicine. Click 'Add' to add new")
        )
    );                
  }
}

