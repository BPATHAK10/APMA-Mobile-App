import 'package:flutter/material.dart';
import 'package:apma/Boxes/boxes.dart';
import 'package:provider/provider.dart';
import 'package:apma/models/medicine_model.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({Key? key}) : super(key: key);

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {

  List<Medicine> medicines = [];

  @override
  Widget build(BuildContext context) {
    final _userEmail = Provider.of<String>(context, listen: false);
    final user = Boxes.getUsers().get(_userEmail);

    if (user!=null){
      user.medicines.forEach((element) {
        var newMedicine = Medicine(element.name,"ml",element.dosage,element.expiryDate,element.frequency);
        setState(() {
          medicines.add(newMedicine);
        });
      });
    }

    return (medicines.isNotEmpty)?
    ListView.builder(
      itemCount: medicines.length,
      itemBuilder: (BuildContext context, int index){
        final currentMed = medicines[index];
        return Container(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Expanded(
                child:Text(
                  currentMed.name,
                  style:const  TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Text('${currentMed.dosage}')
            ]
          ),
        );
      }
    ): 
    const Center(
      child:Text("No Recent Notifications")
    );
  }
}