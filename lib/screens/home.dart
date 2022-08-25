// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_final_fields, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, non_constant_identifier_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/widgets/program.dart';
import 'package:flutter_application_1/widgets/program_2.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";
  String _dietText_1 = "";
  String _dietText_2 = "";
  bool is_visible = false;
  bool is_visible_2 = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 130,
              child: TextField(
                textAlign: TextAlign.center,
                controller: _heightController,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: accentHexColor,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Height",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8))),
              ),
            ),
            Container(
              width: 130,
              child: TextField(
                textAlign: TextAlign.center,
                controller: _weightController,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: accentHexColor,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Weight",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8))),
              ),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              //FocusScope.of(context).requestFocus(new FocusNode());
              setState(() {
                _bmiResult = _w / (_h * _h);

                if (_bmiResult > 25) {
                  _textResult = "You are over weight";
                  _dietText_2 = "show/hide weight loss program";
                  _dietText_1 = "";
                  is_visible = false;
                } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  _textResult = "You have normal weight";
                  _dietText_1 = "";
                  _dietText_2 = "";
                  is_visible = false;
                  is_visible_2 = false;
                } else {
                  _textResult = "You are under weight";
                  _dietText_1 = "show/hide weight gain program";
                  _dietText_2 = "";
                  is_visible_2 = false;
                }
              });
            },
            child: Container(
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: accentHexColor),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor),
              ),
            ),
          ),
          SizedBox(
            height: 65,
          ),
         
          Visibility(
            visible: _dietText_1.isNotEmpty,
            child: Container(
              width: 250,
              height: 65,
    
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    is_visible = !is_visible;
                    if(is_visible) 
                    {
                      is_visible_2 = false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: mainHexColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight: Radius.circular(15))
                  ),
                  shadowColor: accentHexColor,
                  elevation: 20,
                ),
                child: Text(
                  _dietText_1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    //color: accentHexColor,
                  ),
                ),
              ),
            ),
          ),

          Visibility(
            visible: _dietText_2.isNotEmpty,
            child: Container(
              width: 250,
              height: 65,
    
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    is_visible_2 = !is_visible_2;
                    if(is_visible_2)
                    {
                      is_visible = false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: mainHexColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight: Radius.circular(15))
                  ),
                  shadowColor: accentHexColor,
                  elevation: 20,
                ),
                child: Text(
                  _dietText_2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    //color: accentHexColor,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 35,
          ),
          program_1(isVisible: is_visible),
          program_2(isVisible: is_visible_2),
        ],
      )),
    );
  }
}
