import 'package:calculator_app/calculator_logic/expression_dto.dart';
import 'package:calculator_app/calculator_logic/operations/operations.dart';
import 'package:calculator_app/core/core.dart';

class ExpressionHandler {
  double calculateExpression(ExpressionDto dto) {
    final List<BaseOperation> unorderedOps = [
      DivOperation(),
      MulOperation(),
      ModOperation(),
    ];

    List<double> tamperedValues = dto.values;
    List<BaseOperation> tamperedOperations = dto.operations;

    for (int i = 0; i < tamperedOperations.length; ++i) {
      final BaseOperation current = tamperedOperations[i];

      if (unorderedOps.contains(current)) {
        final double left = tamperedValues[i];
        final double right = tamperedValues[i + 1];
        tamperedValues.removeAt(i + 1);
        tamperedValues.removeAt(i);

        tamperedOperations.removeAt(i);

        final result = current.calc(left, right);

        tamperedValues.insert(i, result);
        --i;
      }
    } //'12+10/5*3-9-8*2-13%6'
    print(tamperedOperations);

    print(tamperedValues);
    for (int i = 0; i < tamperedOperations.length; ++i) {
      final BaseOperation current = tamperedOperations[i];

      final double left = tamperedValues[i];
      final double right = tamperedValues[i + 1];
      tamperedValues.removeAt(i + 1);
      tamperedValues.removeAt(i);

      tamperedOperations.removeAt(i);

      final result = current.calc(left, right);

      tamperedValues.insert(i, result);
      --i;
    }

    print(tamperedOperations);
    print(tamperedValues);
    return tamperedValues.first;
  }
}
