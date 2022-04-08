import 'package:flutter/material.dart';

class PainTrack extends StatefulWidget {
  PainTrack({Key? key}) : super(key: key);

  @override
  State<PainTrack> createState() => _PainTrackState();
}

class _PainTrackState extends State<PainTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAIN'),
      ),
      body: Container(
        child: Text('PainTrack'),
      ),
    );
  }
}