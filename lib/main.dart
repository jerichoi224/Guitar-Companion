import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

import 'HomeWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guitar Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  State createState() => _MainState();
}

class _MainState extends State<MainApp> {
  PermissionStatus _permissionStatus = PermissionStatus.undetermined;
  Permission _permission = Permission.microphone;
  bool _denied = false;
  @override
  void initState() {

    super.initState();
    _checkPermission(_permission).then((value) => setState((){
      _permissionStatus = value;
      if(!_permissionStatus.isGranted){
        _requestPermission(_permission);
      }
      if(_permissionStatus.isPermanentlyDenied){
        setState(() {
          _denied = true;
        });
      }
    }));
  }

  Widget build(BuildContext context){
    if(_permissionStatus.isGranted) {
      new Timer(new Duration(milliseconds: 1000), () {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (BuildContext ctx) =>
            new HomeWidget(
              parentCtx: context,)));
      });
    }
    return Scaffold(
        body: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "LOGO",
                  style: TextStyle(
                      fontSize: 40
                  ),
                ),
              ),
              if(_denied)(
                  Text(
                      "Microphone Permission is needed to continue"
                  )
              )
            ]
        )
    );
  }

  Future<PermissionStatus> _checkPermission(Permission permission) async{
    return permission.status;
  }

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      _denied = status.isDenied || status.isPermanentlyDenied;
      _permissionStatus = status;
    });
  }
}