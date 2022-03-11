import 'package:get/get.dart';

import 'package:getx_calculator_app/src/controllers/calculator_state.dart';

class CalculatorController extends GetxController {
  RxString operand1  = ''.obs;
  RxString operation = ''.obs;
  RxString operand2  = ''.obs;
  RxString result    = ''.obs;

  //-Tambien podriamos crear una combinacion con los state de bloc, se generaran siempre nuevos estados
  Rx<CalculatorState> calcultor = const CalculatorState().obs;
  
  void reset() {
    operand1.value  = '';
    operation.value = '';
    operand2.value  = '';
    result.value    = '';

    calcultor.value = const CalculatorState();
  }

  void sign() {
    if(result.isNotEmpty){
      final value = result.value[0] == '-' ? result.substring(1) : '-' + result.value;
      
      result.value = value;
      calcultor.value = calcultor.value.copyWith(result: value);
    }
  }

  void del(){
    if(result.isNotEmpty){
      final last = result.value.length == 2 && result.contains('-') ? 2 : 1;
      final value = result.substring(0, result.value.length - last);

      result.value = value;
      calcultor.value = calcultor.value.copyWith(result: value);
    }
  }

  num _calculate() {
    num value = 0;

    switch(operation.value) {
      case '+':
        value = double.parse(operand1.value) + double.parse(result.value);
        break;
      case '-':
        value = double.parse(operand1.value) - double.parse(result.value);
        break;
      case 'x':
        value = double.parse(operand1.value) * double.parse(result.value);
        break;
      case '/':
        value = double.parse(operand1.value) / double.parse(result.value);
        break;
    }

    return value % 1 == 0 ? value.toInt() : value;
  }

  void write(String number){
    if(number == '.' && result.contains('.')) return;
    if(result.value.length == 1 && number == '0' && result.value[0] == '0') return;

    final prefix = (result.isEmpty && number == '.') ? '0' : '';
    String value = prefix + result.value + number;

    if(value.length == 2 && value[0] == '0' && number != '.'){
      value = value.substring(1);
    }

    result.value = value;
    calcultor.value = calcultor.value.copyWith(result: value);
  }

  void operate(String operation) {
    if(operand1.isEmpty && result.isEmpty){} //-inhabilita cunado no se tiene nada
    if(operand1.isEmpty){
      //-Se hace primero aqui para no perder los valores
      calcultor.value = calcultor.value.copyWith(operand1: result.value, operation: operation, result: '');

      operand1.value = result.value;
      result.value = '';
      this.operation.value = operation;
    } 
    else if(operand1.isNotEmpty && result.isEmpty){
      this.operation.value = operation;
      calcultor.value = calcultor.value.copyWith(operation: operation); //-Aqui no importa que se haga primero
    } 
    else if(operand2.isEmpty && result.isNotEmpty) {
      final value = _calculate().toString();

      operand1.value = value;
      this.operation.value = operation;
      result.value = '';

      calcultor.value = calcultor.value.copyWith(operand1: value, operation: operation, result: '');
    } 
    else if(operand2.isNotEmpty){
      calcultor.value = calcultor.value.copyWith(operand1: result.value, operation: operation, operand2: '', result: '');
  
      operand1.value = result.value;
      this.operation.value = operation;
      result.value = '';
      operand2.value = '';
    }
  }

  void resolve(){
    //-Con la condicion de la mitad evitamos que se acumulen operaciones al presionar el boton de nuevo
    // if(operation.isNotEmpty && operand2.isEmpty && result.isNotEmpty){
    if(operation.isNotEmpty && result.isNotEmpty){
      final value = _calculate().toString();

      calcultor.value = calcultor.value.copyWith(operand2: result.value, result: value);

      operand2.value = result.value;
      result.value = value;
    }
  }

}