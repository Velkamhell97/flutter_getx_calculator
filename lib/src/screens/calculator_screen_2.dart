import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_calculator_app/src/models/button.dart';
import 'package:getx_calculator_app/src/widgets/calculator_button.dart';
import 'package:getx_calculator_app/src/controllers/calculator_controller.dart';

class CalculatorScreen2 extends StatelessWidget {
  const CalculatorScreen2({Key? key}) : super(key: key);

  static const _buttons = Button.buttons;

  static const _style = TextStyle(color: Colors.white, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalculatorController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Obx(
                  () {
                    final calculator = controller.calcultor.value; //-Tambien podemos usar el estado

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Spacer(),
                        // Text(controller.operand1.value,  style: _style),
                        Text(calculator.operand1,  style: _style),
                        // Text(controller.operation.value, style: _style),
                        Text(calculator.operation, style: _style),
                        // Text(controller.operand2.value,  style: _style),
                        Text(calculator.operand2,  style: _style),
                        const Divider(color: Colors.grey, thickness: 2),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              alignment: Alignment.centerRight,
                              // child: Text(controller.result.value, style: _style.copyWith(fontSize: 50))
                              child: Text(calculator.result, style: _style.copyWith(fontSize: 50))
                            ),
                          )
                        ),
                      ],
                    );
                  }
                ),
              ),

              Expanded(
                flex: 7,
                child: Container(
                  // color: Colors.red.withOpacity(0.5),
                  child: Column(
                    children: [
                      ...List.generate(5, (i) {
                        return Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    ...List.generate(4, (index) {
                                      final j = (i * 4) + index;
                                      if(j == 19) return const SizedBox();
                              
                                      final button = _buttons[j];
                                      //-Con la solucion 1 se asigna el onPress (evento) de cada boton dependiendo su tipo o id
                                      // final calculatorButton = button.copyWith(onPressed: getFunction(context, button));
                                                    
                                      return Expanded(
                                        flex: button.isBig ? 2 : 1,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // if(j != (i * 4) && j != ((i + 1) * 4) - 1)
                                            Expanded(
                                              child: CalculatorButton(
                                                // button: calculatorButton
                                                button: button,
                                              ),
                                            ),
                                            
                                          ],
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}