// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_constants.dart';

class program_2 extends StatelessWidget {
  
  final bool isVisible;
  
  const program_2({Key? key , required this.isVisible}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Visibility(
     
      visible: isVisible,  // bir visible_bool yarat ...
      child: Column(children: [
   
      SizedBox(
        width: 350,
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
          shadowColor: accentHexColor,
          elevation: 20,
          color: Colors.grey,
          child: Padding(
            padding:  EdgeInsets.all(45.0),
            child: Text("Sabah\n\n 1 kutu peynir",
            style: TextStyle(color: mainHexColor,fontSize: 20), 
            textAlign: TextAlign.center,
            ),
          ),
        )),

        SizedBox(
        width: 350,
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
          shadowColor: accentHexColor,
          elevation: 20,
          color: Colors.grey,
          child: Padding(
            padding:  EdgeInsets.all(45.0),
            child: Text("Öğle\n\n  1 porsiyon salata ",
            style: TextStyle(color: mainHexColor,fontSize: 20), 
            textAlign: TextAlign.center,
            ),
          ),
        )),


        SizedBox(
        width: 350,
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
          shadowColor: accentHexColor,
          elevation: 20,
          color: Colors.grey,
          child: Padding(
            padding:  EdgeInsets.all(45.0),
            child: Text("Akşam\n\n  1 tabak tavuk pilav",
            style: TextStyle(color: mainHexColor,fontSize: 20), 
            textAlign: TextAlign.center,
            ),
          ),
        )),


    ],));
  }
}
