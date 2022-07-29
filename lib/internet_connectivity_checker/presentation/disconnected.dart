import 'package:flutter/material.dart';

class disconnected extends StatefulWidget{
  @override
  _disconnectedState createState() => _disconnectedState();
}

class _disconnectedState extends State<disconnected>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text(
          "Not Connected to Internet.",
          style: TextStyle(
            fontFamily: 'Courgette'
          ),
        ),
      ),
    );
  }
}