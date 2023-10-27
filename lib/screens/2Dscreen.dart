import 'package:flutter/material.dart';
import 'package:woodcutlistoptimiser/screens/results.dart';

import '../model/geneticAlgorithm.dart';
import '../model/greedyAlgorithm.dart';
import '../widgets/customDialog.dart';

class TwoDimenisonal extends StatefulWidget {
  TwoDimenisonal({required this.aim});
  final String aim;

  @override
  State<TwoDimenisonal> createState() => _TwoDimenisonalState();
}

class _TwoDimenisonalState extends State<TwoDimenisonal> {
  String changingText = "";

  ///Panels/Parts controllers
  List<TextEditingController> myControllerLength = [];
  List<double> paneLengthArr = [];
  List<TextEditingController> myControllerWidth = [];
  List<double> panelWidththArr = [];
  int paneLengthAddCount = 0;

  ///Panels/Parts widget builder
  List<Widget> list = [];

  ///Sheets/Planks controllers
  List<TextEditingController> sheetsControllerLength = [];
  List<double> sheetsLenghtArr = [];
  List<TextEditingController> sheetsControllerWidth = [];
  List<double> sheetsWidthtArr = [];
  int sheetsLengthAddCount = 0;

  ///Sheets/Planks widget builder
  List<Widget> sheetsList = [];
  showError(String changingText) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(changingText),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void showMyDialog(BuildContext context, String myText, Optimizer optimizer, GeneticAlgorithm ga) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyCustomDialog(
          optimizer: optimizer,
          ga: ga,
        );
      },
    );
  }

  @override
  void dispose() {
    ///Panels/Parts controllers
    myControllerLength.forEach((controller) => controller.dispose());

    myControllerWidth.forEach((controller) => controller.dispose());

    ///Sheets/Planks controllers
    sheetsControllerLength.forEach((controller) => controller.dispose());

    sheetsControllerWidth.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text("Two Dimensional"),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "click +add button to input length and width",
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),

            ///************************************      Start of Parts header section    ************************************************************************
            Container(
              height: 40,
              color: Colors.black12,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.auto_awesome_mosaic,
                    color: Colors.white70,
                  ),
                  Text(
                    "Panels/Parts",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          //Icon(Icons.add),
                          Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "add",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        myControllerLength.add(TextEditingController());
                        myControllerWidth.add(TextEditingController());
                        list = List.from(list)
                          ..add(panelDimensions(list.length));
                        paneLengthAddCount++;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),

            ///************************************       End of Parts header section    ************************************************************************
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 250,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) => list[index],
              ),
            ),

            ///************************************       Start of Sheets / Planks         ************************************************************************
            Container(
              height: 40,
              color: Colors.black12,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.layers,
                    color: Colors.white70,
                  ),
                  Text(
                    "Sheets/Planks",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          //Icon(Icons.add),
                          Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "add",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        sheetsControllerLength.add(TextEditingController());
                        sheetsControllerWidth.add(TextEditingController());
                        sheetsList = List.from(sheetsList)
                          ..add(sheetsDimensions(sheetsList.length));
                        sheetsLengthAddCount++;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),

            ///************************************       End of Sheets / Planks         ************************************************************************
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 250,
              child: ListView.builder(
                itemCount: sheetsList.length,
                itemBuilder: (_, sheetsIndex) => sheetsList[sheetsIndex],
              ),
            ),

            /// Start of Calculate Button
            GestureDetector(
              child: Container(
                width: 120,
                height: 50,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Colors.green),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Calculate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  if (list.isEmpty) {
                    changingText =
                        "Please add atleast one Panel/Part and fill all fields";
                    showError(changingText);
                  } else if (sheetsList.isEmpty) {
                    changingText =
                        "Please add atleast one Sheet/Plank and fill all fields";
                    showError(changingText);
                  } else {
                    /// Getting inside ----------------

                    bool allFilled = true;
                    myControllerLength.forEach((controller) {
                      if (controller.text.isEmpty) allFilled = false;
                    });
                    myControllerWidth.forEach((controller) {
                      if (controller.text.isEmpty) allFilled = false;
                    });
                    sheetsControllerLength.forEach((controller) {
                      if (controller.text.isEmpty) allFilled = false;
                    });
                    sheetsControllerWidth.forEach((controller) {
                      if (controller.text.isEmpty) allFilled = false;
                    });
                    if (!allFilled) {
                      changingText = "Please fill all the fields";
                      showError(changingText);
                    } else {
                      changingText = "";

                      //_showDialog(changingText,filled);
                      print("my output **********************?/////////////");
                      myControllerLength.forEach((controller) {
                        // print(controller.text);
                        paneLengthArr.add(double.parse(controller.text));
                      });
                      print("panel length array");
                      print(paneLengthArr);

                      ///end of filling panel length array
                      myControllerWidth.forEach((controller) {
                        // print(controller.text);
                        panelWidththArr.add(double.parse(controller.text));
                      });
                      print("panel width array");
                      print(panelWidththArr);

                      ///Done with the panels
                      ///
                      ///start of Sheets
                      sheetsControllerLength.forEach((controller) {
                        sheetsLenghtArr.add(double.parse(controller.text));
                      });
                      print("sheets length array");
                      print(sheetsLenghtArr);

                      ///Done with sheets Length array
                      sheetsControllerWidth.forEach((controller) {
                        sheetsWidthtArr.add(double.parse(controller.text));
                      });
                      print("sheets width array");
                      print(sheetsWidthtArr);

                      ///External class time
                      for (int i = 0; i < paneLengthArr.length; i++) {
                        List<Panel> panels = [
                          Panel(paneLengthArr[i], panelWidththArr[i]),
                        ];
                      }
                      //   List<Panel> panels = [
//     Panel(1, 1),
//     Panel(0, 0),
//     Panel(0, 0),
//   ];
                      ///Go to next Page
                      print(
                          "******************************** Production ******************************* ");
                      print("sheets length array");
                      List<Panel> panels = [];
                      for (int i = 0; i < paneLengthArr.length; i++) {
                        panels.add(Panel(paneLengthArr[i], panelWidththArr[i]));
                        print("${paneLengthArr[i]}, ${panelWidththArr[i]}");
                      }

                      /// End of panel transmission
                      List<Sheet> sheets = [];
                      for (int i = 0; i < sheetsLenghtArr.length; i++) {
                        panels
                            .add(Panel(sheetsLenghtArr[i], sheetsWidthtArr[i]));
                        print("${sheetsLenghtArr[i]}, ${sheetsWidthtArr[i]}");
                      }

                      List<Cut> cuts = [];
                      Optimizer optimizer = Optimizer(panels, sheets, cuts);
                      optimizer.optimize();
                      optimizer.printStats();
                      optimizer.printCuts();

                      ///End of Greedy algorithm

                      List<Individual> population = [];
                      GeneticAlgorithm ga = GeneticAlgorithm(population, sheets, 0);
                      ga.initializePopulation(20, panels);
                      for (int i = 0; i < 100; i++) {
                        ga.evolve();
                      }
                      print("8****************** Geeeenetic *******************");
                      ga.printStats();
                      ga.printOrder();

                      //showMyDialog(context,changingText,optimizer);
                      /// Seriaosly , Go to Results Page *******************?? //??
                      showMyDialog(context,changingText,optimizer,ga);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             ResultScreen(optimizer: optimizer,ga: ga,)));

                      ///*****************
                      ///after all code
                      paneLengthArr = [];
                      myControllerLength.forEach((controller) {
                        controller.text = "";
                      });
                      panelWidththArr = [];
                      myControllerWidth.forEach((controller) {
                        controller.text = "";
                      });

                      ///
                      sheetsLenghtArr = [];
                      sheetsControllerLength.forEach((controller) {
                        controller.text = "";
                      });
                      sheetsWidthtArr = [];
                      sheetsControllerWidth.forEach((controller) {
                        controller.text = "";
                      });

                      // for( int i=0; i<list.length; i++){
                      //   list.removeAt(i);
                      // }
                      // for( int i=0; i<sheetsList.length; i++){
                      //   sheetsList.removeAt(i);
                      // }
                    }
                  }
                });
              },
            ),

            ///End of Calculate Button
          ],
        ),
      ),
    );
  }

  Widget panelDimensions(int index) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 8,
              ),
              Text("${index + 1}"),
              SizedBox(
                width: 8,
              ),
              Container(
                width: 120,
                child: TextField(
                  controller: myControllerLength[index],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Length',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 120,
                child: TextField(
                  controller: myControllerWidth[index],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Width',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    list.removeAt(index);
                    myControllerLength.removeAt(index);
                    myControllerWidth.removeAt(index);
                    paneLengthAddCount--;
                  });
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red[900],
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget sheetsDimensions(int sheetsIndex) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 8,
              ),
              Text("${sheetsIndex + 1}"),
              SizedBox(
                width: 8,
              ),
              Container(
                width: 120,
                child: TextField(
                  controller: sheetsControllerLength[sheetsIndex],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Length',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 120,
                child: TextField(
                  controller: sheetsControllerWidth[sheetsIndex],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Width',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    sheetsList.removeAt(sheetsIndex);
                    sheetsControllerLength.removeAt(sheetsIndex);
                    sheetsControllerWidth.removeAt(sheetsIndex);
                    sheetsLengthAddCount--;
                  });
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red[900],
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
