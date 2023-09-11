abstract class BaseOperation {
  final String symbol;

  BaseOperation(this.symbol);

  double calc(double left, double right);

  @override
  String toString() {
    return symbol;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseOperation && other.symbol == symbol;
  }

  @override
  int get hashCode => symbol.hashCode;
}
