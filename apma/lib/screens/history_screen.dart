import 'package:apma/widgets/custom_appbar.dart';
import 'package:apma/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'package:apma/Boxes/boxes.dart';
import 'package:provider/provider.dart';
import 'package:apma/models/pain_model.dart';

class HistoryScreen extends StatefulWidget {
  
  const HistoryScreen({ Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  
  List<Pain> pains = [];
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _userEmail = Provider.of<String>(context, listen: false);
    final user = Boxes.getUsers().get(_userEmail);
    
    user?.pains.forEach((element) {
        var pain = Pain(element.date,element.type,element.intensity,element.hasMedication);
        setState(() {
          pains.add(pain);
        });
      }
    );

    return Scaffold(
      appBar: showAppBar(context,'My History'),
      drawer: showDrawer(context),
      body:
        (pains.isNotEmpty)?
        ListView.builder(
          itemCount: pains.length,
          itemBuilder: (BuildContext context, int index){
            final currentPain = pains[index];
            return Container(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Expanded(
                    child:Text(
                      '${currentPain.intensity} + ${currentPain.type}',
                      style:const  TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text('${currentPain.date}')
                ]
              ),
            );
          }
        ): 
        const Center(
          child:Text("No Recent History")
        )
    );
  }
}