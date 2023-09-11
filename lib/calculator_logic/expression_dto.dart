import 'package:calculator_app/core/base_operation.dart';

class ExpressionDto {
  final List<double> values;
  final List<BaseOperation> operations;

  ExpressionDto({
    required this.values,
    required this.operations,
  }) : assert(values.length - 1 == operations.length,
            'values.length-1!=operation.length');

  @override
  String toString() =>
      'ExpressionDto(values: $values, operations: $operations)';
}
