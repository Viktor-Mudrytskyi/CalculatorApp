import 'package:calculator_app/core/base_operation.dart';
import 'package:calculator_app/core/calculator_exception.dart';
import 'package:calculator_app/calculator_logic/expression_dto.dart';
import 'package:calculator_app/calculator_logic/operations/operations.dart';

class InputParser {
  ExpressionDto parse(String input) {
    int index = -1;
    BaseOperation? operation;
    for (int i = 0; i < input.length; ++i) {
      if (input[i] == "+") {
        index = i;
        operation = AddOperation();
        break;
      } else if (input[i] == "-") {
        index = i;
        operation = SubOperation();
        break;
      } else if (input[i] == "*") {
        index = i;
        operation = MulOperation();
        break;
      } else if (input[i] == "/") {
        index = i;
        operation = DivOperation();
        break;
      }
    }

    if (index <= 0 || operation == null) {
      throw CalculatorException(text: "index > 0 && operation !=null");
    }

    final List<String> parts = input.split(operation.symbol);
    if (parts.length != 2) {
      throw CalculatorException(text: "parts.length != 2");
    }

    final double left = double.tryParse(parts[0]) ?? 0.0;
    final double right = double.tryParse(parts[1]) ?? 0.0;

    return ExpressionDto(
      operation: operation,
      left: left,
      right: right,
    );
  }
}
