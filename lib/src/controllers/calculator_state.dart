class CalculatorState {
  final String operand1;
  final String operation;
  final String operand2;
  final String result;

  const CalculatorState({
    this.operand1  = '', 
    this.operation = '', 
    this.operand2  = '', 
    this.result    = '',
  });

  CalculatorState copyWith({
    String? operand1,
    String? operation,
    String? operand2,
    String? result,
  }) => CalculatorState(
    operand1: operand1 ?? this.operand1,
    operation: operation ?? this.operation,
    operand2: operand2 ?? this.operand2,
    result: result ?? this.result,
  );
}