import 'package:calculator_app/core/base_operation.dart';

class ModOperation extends BaseOperation {
  ModOperation() : super("%");

  @override
  double calc(double left, double right) {
    return left % right;
  }
}
