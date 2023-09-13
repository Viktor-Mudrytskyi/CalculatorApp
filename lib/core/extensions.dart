extension StringUtils on String {
  int get lastIndex => length - 1;

  String get last => this[lastIndex];
  String get oneBeforeLast => this[lastIndex - 1];

  String get first => this[0];
}
