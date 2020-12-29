import 'package:flutter/material.dart';

class TunerWidget extends StatefulWidget {
  TunerWidget({Key key});

  @override
  State createState() => _TunerState();

}

class _TunerState extends State<TunerWidget>{
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
              "Tuner",
              style: new TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        )
    );
  }
}

