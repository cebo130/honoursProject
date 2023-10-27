import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:woodcutlistoptimiser/model/greedyAlgorithm.dart';

import '../model/geneticAlgorithm.dart';
import '../screens/results.dart';

class MyCustomDialog extends StatefulWidget {
  MyCustomDialog({required this.optimizer,required this.ga});
  final Optimizer optimizer;
  final  GeneticAlgorithm ga;
  @override
  _MyCustomDialogState createState() => _MyCustomDialogState();
}

class _MyCustomDialogState extends State<MyCustomDialog> {
  String _displayText = 'Calculating...';
  String resultsText = "";
  bool show = false;
  Color color = Colors.red;

  @override
  void initState() {
    super.initState();
    // Simulate the delay of three seconds
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _displayText = 'Done';
        resultsText = 'The Results are this and this and that';
        show = true;
        color = Colors.green;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        AlertDialog(
          title: Row(
            children: [
              Text(_displayText,style: TextStyle(color: color),),
              if(show)LoadingAnimationWidget.bouncingBall(
                color: color,
                size: 20,
              ),
            ],
          ),
          content: show ? Icon(Icons.check_circle,color: Colors.green,size: 40,) : LoadingAnimationWidget.threeRotatingDots(
            color: Colors.green,
            size: 40,
          ),
          actions: <Widget>[
            if(show)TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ResultScreen(optimizer: widget.optimizer,ga: widget.ga,)));
              },
              child: Text('View Results'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ],
    );
  }
}
