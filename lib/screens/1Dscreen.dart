// import 'package:flutter/material.dart';
//
// import '../widgets/customDialog.dart';
//
// class OneDimensional extends StatefulWidget {
//   const OneDimensional({Key? key}) : super(key: key);
//
//   @override
//   State<OneDimensional> createState() => _OneDimensionalState();
// }
//
// class _OneDimensionalState extends State<OneDimensional> {
//   String changingText = "";
//
//   ///Panels/Parts controllers
//   List<TextEditingController> myControllerLength = [];
//   List<double> paneLengthArr = [];
//
//
//   ///Panels/Parts widget builder
//   List<Widget> list = [];
//
//   ///Sheets/Planks controllers
//   List<TextEditingController> sheetsControllerLength = [];
//   List<double> sheetsLenghtArr = [];
//
//
//   ///Sheets/Planks widget builder
//   List<Widget> sheetsList = [];
//   showError(String changingText){
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Error'),
//         content: Text(changingText),
//         actions: <Widget>[
//           TextButton(
//             child: Text('OK'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   void showMyDialog(BuildContext context,String myText) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return MyCustomDialog(myText: myText,);
//       },
//     );
//   }
//
//
//   @override
//   void dispose() {
//     ///Panels/Parts controllers
//     myControllerLength.forEach((controller) => controller.dispose());
//
//     ///Sheets/Planks controllers
//     sheetsControllerLength.forEach((controller) => controller.dispose());
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.brown[100],
//       appBar: AppBar(
//         title: Text(" One Dimensional"),
//         backgroundColor: Colors.brown[400],
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             //SizedBox(height: 10,),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "click +add button to input length",
//                   style: TextStyle(fontSize: 16, color: Colors.brown),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 5,
//             ),
//
//             ///************************************      Start of Parts header section    ************************************************************************
//             Container(
//               height: 40,
//               color: Colors.brown[300],
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Icon(Icons.auto_awesome_mosaic),
//                   Text("Panels/Parts"),
//                   Spacer(),
//                   GestureDetector(
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(5),
//                         ),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           //Icon(Icons.add),
//                           Text(
//                             "+",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20),
//                           ),
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Text(
//                             "add",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: () {
//                       setState(() {
//                         myControllerLength.add(TextEditingController());
//                         list = List.from(list)
//                           ..add(panelDimensions(list.length));
//                       });
//                     },
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                 ],
//               ),
//             ),
//
//             ///************************************       End of Parts header section    ************************************************************************
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               color: Colors.white,
//               height: 250,
//               child: ListView.builder(
//                 itemCount: list.length,
//                 itemBuilder: (_, index) => list[index],
//               ),
//             ),
//
//             ///************************************       Start of Sheets / Planks         ************************************************************************
//             Container(
//               height: 40,
//               color: Colors.brown[300],
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Icon(Icons.layers),
//                   Text("Sheets/Planks"),
//                   Spacer(),
//                   GestureDetector(
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(5),
//                         ),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           //Icon(Icons.add),
//                           Text(
//                             "+",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20),
//                           ),
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Text(
//                             "add",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: () {
//                       setState(() {
//                         sheetsControllerLength.add(TextEditingController());
//
//                         sheetsList = List.from(sheetsList)
//                           ..add(sheetsDimensions(sheetsList.length));
//
//                       });
//                     },
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                 ],
//               ),
//             ),
//
//             ///************************************       End of Sheets / Planks         ************************************************************************
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               color: Colors.white,
//               height: 250,
//               child: ListView.builder(
//                 itemCount: sheetsList.length,
//                 itemBuilder: (_, sheetsIndex) => sheetsList[sheetsIndex],
//               ),
//             ),
//
//             /// Start of Calculate Button
//             GestureDetector(
//               child: Container(
//                 width: 120,
//                 height: 50,
//                 padding: EdgeInsets.all(5),
//                 margin: EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(8),
//                     ),
//                     color: Colors.green),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         "Calculate",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               onTap: () {
//                 setState(() {
//                   if(list.isEmpty){
//                     changingText = "Please add atleast one Panel/Part and fill all fields";
//                     showError(changingText);
//                   }else if(sheetsList.isEmpty){
//                     changingText = "Please add atleast one Sheet/Plank and fill all fields";
//                     showError(changingText);
//                   }else{
//                     /// Getting inside ----------------
//
//                     bool allFilled = true;
//                     myControllerLength.forEach((controller) {
//                       if (controller.text.isEmpty) allFilled = false;
//                     });
//
//                     sheetsControllerLength.forEach((controller) {
//                       if (controller.text.isEmpty) allFilled = false;
//                     });
//
//                     if (!allFilled) {
//                       changingText = "Please fill all the fields";
//                       showError(changingText);
//                     } else {
//                       changingText = "";
//                       showMyDialog(context,changingText);
//                       //_showDialog(changingText,filled);
//                       print("my output **********************?/////////////");
//                       myControllerLength.forEach((controller) {
//                         // print(controller.text);
//                         paneLengthArr.add(double.parse(controller.text));
//                       });
//                       print("panel length array");
//                       print(paneLengthArr);
//
//                       ///end of filling panel length array
//
//
//
//
//                       ///Done with the panels
//                       ///
//                       ///start of Sheets
//                       sheetsControllerLength.forEach((controller) {
//                         sheetsLenghtArr.add(double.parse(controller.text));
//                       });
//                       print("sheets length array");
//                       print(sheetsLenghtArr);
//
//                       ///Done with sheets Length array
//
//
//                       ///External class time
//
//                       ///Go to next Page
//                       ///*****************
//                       ///after all code
//                       paneLengthArr = [];
//                       myControllerLength.forEach((controller) {
//                         controller.text = "";
//                       });
//
//
//                       ///
//                       sheetsLenghtArr = [];
//                       sheetsControllerLength.forEach((controller) {
//                         controller.text = "";
//                       });
//
//
//                       // for( int i=0; i<list.length; i++){
//                       //   list.removeAt(i);
//                       // }
//                       // for( int i=0; i<sheetsList.length; i++){
//                       //   sheetsList.removeAt(i);
//                       // }
//
//                     }
//                   }
//                 });
//               },
//             ),
//
//             ///End of Calculate Button
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget panelDimensions(int index) {
//     return Column(
//       children: [
//         Container(
//           width: 350,
//           height: 35,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 width: 8,
//               ),
//               Text("${index + 1}"),
//               SizedBox(
//                 width: 8,
//               ),
//               Container(
//                 width: 120,
//                 child: TextField(
//                   controller: myControllerLength[index],
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Length',
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//               SizedBox(width: 10),
//               SizedBox(width: 20),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     list.removeAt(index);
//                     myControllerLength.removeAt(index);
//                   });
//                 },
//                 icon: Icon(
//                   Icons.delete_forever,
//                   color: Colors.red[900],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(),
//       ],
//     );
//   }
//
//   Widget sheetsDimensions(int sheetsIndex) {
//     return Column(
//       children: [
//         Container(
//           width: 350,
//           height: 35,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 width: 8,
//               ),
//               Text("${sheetsIndex + 1}"),
//               SizedBox(
//                 width: 8,
//               ),
//               Container(
//                 width: 120,
//                 child: TextField(
//                   controller: sheetsControllerLength[sheetsIndex],
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Length',
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//               SizedBox(width: 10),
//               SizedBox(width: 20),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     sheetsList.removeAt(sheetsIndex);
//                     sheetsControllerLength.removeAt(sheetsIndex);
//                   });
//                 },
//                 icon: Icon(
//                   Icons.delete_forever,
//                   color: Colors.red[900],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(),
//       ],
//     );
//   }
// }
//
