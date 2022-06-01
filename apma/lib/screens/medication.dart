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
    medicines.add(Medicine("Agomelatine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Amantadine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Amitriptyline",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Baclofen",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Capsaicin",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Carbamazepine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Celecoxib",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Citalopram",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Clomipramine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Clonidine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Codeine",'ml',30.0, DateTime(2030,12,11), 3));
    
    medicines.add(Medicine("Desvenlafaxine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Diclofenac",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Dothiepin",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Doxepin",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Escitalopram",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Duloxetine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Fentanyl",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Fluoxetine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Fluvoxamine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Gabapentin",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Hydromorphone",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Ibuprofen",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Imiprimine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Ketamine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Lamotrigine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Lignocaine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Lyrica",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Magnesium",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Meloxicam",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Memantine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Methadone",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Mianserin",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Mirtazapine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Moclobemide",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Morphine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Naproxen",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Nortriptyline",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Orphenadrine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Oxycodone",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Oxcarbamazepine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Palmitoylethanolamide",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Paracetamol",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Palexia",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Paroxetine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Phenelzine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Pregabalin",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Reboxetine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Sertraline",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Tapentadol",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Topiramate",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Topiramate",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Tramandol",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Tranylcypromine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Trimipramine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Valproate",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Venlafaxine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Venlafaxine",'ml',30.0, DateTime(2030,12,11), 3));
    medicines.add(Medicine("Vortioxetine",'ml',30.0, DateTime(2030,12,11), 3));
  }
  @override
  Widget build(BuildContext context) {
    final _userEmail = Provider.of<String>(context, listen: false);
    final user = Boxes.getUsers().get(_userEmail);
  
    // print(user?.medicines.length);
    if (user!=null){
      user.medicines.forEach((element) {
        var newMedicine = Medicine(element.name,"ml",element.dosage,element.expiryDate,element.frequency);
        setState(() {
          medicines.add(newMedicine);
        });
      });
    }
    medicines.sort((a,b)=> a.name.compareTo(b.name));

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
                      });
                      user!.medicines.add(medication);
                      user.save();
                        // medicines.add(medication);
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
              expandedAlignment: Alignment.topLeft,
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

