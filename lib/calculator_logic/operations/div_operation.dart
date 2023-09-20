import 'package:calculator_app/core/core.dart';

class DivOperation extends BaseOperation {
  DivOperation() : super("/");

  @override
  double calc(double left, double right) {
    // if (right == 0.0) {
    //   throw CalculatorException(text: 'Cant divide by zero');
    // }
    return left / right;
  }
}
