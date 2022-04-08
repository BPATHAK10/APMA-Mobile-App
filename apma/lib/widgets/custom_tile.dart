import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("pressed");
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
           BoxShadow(
            color: Colors.grey.shade600,
            blurRadius: 10.0,
          ),
        ]),
        child: Card(
          shadowColor: Colors.black,
          color: Colors.blueAccent,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Text(
              title,
              style: TextStyle(fontSize: 25),
            )),
          ),
        ),
      ),
    );
  }
}
