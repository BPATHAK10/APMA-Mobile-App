import 'package:apma/models/energy_model.dart';
import 'package:apma/models/food_model.dart';
import 'package:apma/models/movement_model.dart';
import 'package:apma/models/sleep_model.dart';
import 'package:apma/widgets/custom_appbar.dart';
import 'package:apma/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:apma/constants.dart';
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
  List<Food> foods = [];
  List<Movement> movements = [];
  List<Sleep> sleeps = [];
  List<Energy> energies = [];
  
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
    user?.energy.forEach((element) {
        var energy = Energy(element.date,element.intensity,element.mood);
        setState(() {
          energies.add(energy);
        });
      }
    );
    user?.food.forEach((element) {
        var food = Food(element.date,element.time,element.whom,element.mood,element.symptoms,element.hunger,element.fullness);
        setState(() {
          foods.add(food);
        });
      }
    );
    user?.movement.forEach((element) {
        var movement = Movement(element.date,element.type,element.moodBefore,element.moodAfter,element.timeFor,element.painBefore,element.painAfter);
        setState(() {
          movements.add(movement);
        });
      }
    );

    return Scaffold(
      appBar: showAppBar(context,'My History'),
      drawer: showDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            (pains.isNotEmpty)?
            ListView.builder(
              shrinkWrap: true,
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
                          painItems[(currentPain.intensity).toInt()] +' '+ currentPain.type,
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
              child:Text("No Pain History")
            ),
            const Divider(
                color: Colors.black,
                height: 80,
            ),
            (energies.isNotEmpty)?
            ListView.builder(
              shrinkWrap: true,
              itemCount: energies.length,
              itemBuilder: (BuildContext context, int index){
                final currentEnergy = energies[index];
                return Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget> [
                      Expanded(
                        child:Text(
                          'Energy Level: '+ '${currentEnergy.intensity}',
                          style:const  TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text('${currentEnergy.date}')
                    ]
                  ),
                );
              }
            ): 
            const Center(
              child:Text("No Energy History")
            ),
            const Divider(
                color: Colors.black,
                height: 80,
            ),
            (foods.isNotEmpty)?
            ListView.builder(
              shrinkWrap: true,
              itemCount: foods.length,
              itemBuilder: (BuildContext context, int index){
                final currentFood = foods[index];
                return Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget> [
                      Expanded(
                        child:Text(
                          currentFood.mood +' Hunger Level: '+ '${currentFood.hunger}',
                          style:const  TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text('${currentFood.date}')
                    ]
                  ),
                );
              }
            ): 
            const Center(
              child:Text("No Food History")
            ),
            const Divider(
                color: Colors.black,
                height: 80,
            ),
            (movements.isNotEmpty)?
            ListView.builder(
              shrinkWrap: true,
              itemCount: movements.length,
              itemBuilder: (BuildContext context, int index){
                final currentMovement = movements[index];
                return Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget> [
                      Expanded(
                        child:Text(
                          currentMovement.type +' '+ currentMovement.timeFor,
                          style:const  TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text('${currentMovement.date}')
                    ]
                  ),
                );
              }
            ): 
            const Center(
              child:Text("No Movement History")
            ),
          ],
        ),
      )
        

        
    );
  }
}