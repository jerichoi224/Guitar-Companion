import 'package:flutter/material.dart';

class MetronomeWidget extends StatefulWidget {
  MetronomeWidget({Key key});

  @override
  State createState() => _MetronomeState();

}

class _MetronomeState extends State<MetronomeWidget>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    // App Loads
    return Scaffold(
        body: new Container(
          child: new Center(
            child: Text(
              "Metronome",
              style: new TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        )
    );
  }
}

