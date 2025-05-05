import 'package:flutter/material.dart';
import 'package:roll_dice/dice_roller.dart';


var broosi= "bbb aa Hello World";

class GradientContainer extends StatelessWidget{
  const GradientContainer({super.key});
  @override
   Widget build(context){
    return Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [const Color.fromARGB(255, 94, 168, 218), Colors.pink],
        begin: Alignment.topLeft, // Optional: Gradient start point
            end: Alignment.bottomRight,)),
        child:  Center(
          child: DiceRoller()
        ),
      );
   }
}