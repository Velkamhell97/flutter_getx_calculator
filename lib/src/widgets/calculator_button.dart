import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/button.dart';
import 'package:getx_calculator_app/src/controllers/calculator_controller.dart';

class CalculatorButton extends StatelessWidget {
  final Button button;

  const CalculatorButton({Key? key, required this.button}) : super(key: key);

  void _onPressed(){
    final controller = Get.find<CalculatorController>();

    switch(button.id){
      case 1:
        return controller.reset();
      case 2:
        return controller.sign();
      case 3:
        return controller.del();
      case 4:
      case 8:
      case 12:
      case 16:
        return controller.operate(button.text);
      case 19:
        return controller.resolve();
      default: 
        return controller.write(button.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // type: MaterialType.transparency,
      color: Color(button.color),
      shape: button.isBig ? const StadiumBorder() : const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: _onPressed,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(button.text, style: const TextStyle(color: Colors.white),),
          )
        ),
      ),
    );
  }
}

