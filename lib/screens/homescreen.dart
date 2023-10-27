import 'package:flutter/material.dart';
import 'package:woodcutlistoptimiser/screens/1Dscreen.dart';

import '../model/greedyAlgorithm.dart';
import '../widgets/customDialog.dart';
import '2Dscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'I want minimize cuts';

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text("Wood Cut Optimiser",style: TextStyle(color: Colors.white70),),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: myHeight * 0.29,
            width: myWidth * 1,
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft:  Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),// Same value as the container
              child: Image(
                image: AssetImage("assets/logo.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: myHeight * 0.05,
            width: myWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown, // Background color
              boxShadow: [
                BoxShadow(
                  color: Colors.black, // Shadow color
                  offset: Offset(4.0, 4.0),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Colors.brown, // Highlight color
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.brown, // Sets the background color of the dropdown
                ),
                child: Center(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.white70),
                    underline: Container(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['I want minimize cuts', 'I want minimize costs', 'I want minimize waste', 'I want minimize sheets']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    icon: Icon(Icons.arrow_drop_down,color: Colors.white70,),
                  ),
                ),
              ),
          ),
          SizedBox(height: 30,),
          /// *******************************************************  End of DropButton   *******************************************************
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  height: myHeight * 0.2,
                  width: myWidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown[400]!,Colors.brown,Colors.brown,
                      ],
                      begin: Alignment.topLeft,
                    ),
                    //color: Colors.brown, // Background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black, // Shadow color
                        offset: Offset(4.0, 4.0),
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Colors.brown, // Highlight color
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("1D",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 20,),
                      Container(
                        height: 10,
                        width: myWidth * 0.3,
                        color: Colors.brown[100]!,
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 1,
                        width: myWidth * 0.3,
                        color: Colors.brown[100]!,
                      ),
                      Text("Length",style: TextStyle(color: Colors.white70),)
                    ],
                  ),
                ),
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>OneDimensional()));
                },
              ),
              /// *******************************************************  End of Button 1   *******************************************************
              SizedBox(width: 20,),
              GestureDetector(
                child: Container(
                  height: myHeight * 0.2,
                  width: myWidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown[400]!,Colors.brown,Colors.brown,
                      ],
                      begin: Alignment.topLeft,
                    ),
                    //color: Colors.brown, // Background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black, // Shadow color
                        offset: Offset(4.0, 4.0),
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Colors.brown, // Highlight color
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("2D",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: -1.5708, // 90 degrees in radians
                            child: Text(
                              'width',
                                style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          Container(
                            height: myHeight * 0.03,
                            width: myWidth * 0.003,
                            color: Colors.white70,
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 10,
                            width: myWidth * 0.2,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: myWidth * 0.15,),
                          Container(
                            height: 1,
                            width: myWidth * 0.2,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: myWidth * 0.15,),
                          Text("Length",style: TextStyle(color: Colors.white70),),
                        ],
                      )
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TwoDimenisonal(aim: dropdownValue.toString(),)));
                },
              ),
              /// *******************************************************  End of Button 2  *******************************************************
            ],
          ),
        ],
      ),
    );
  }
}

