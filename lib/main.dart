import 'package:calculator_app/app.dart';
import 'package:calculator_app/calculator_logic/input_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  // runApp(const CalculatorApp());
  String input = '-12+3.4/-5-9-8*2-13%-6';
  print(InputParser().canParseLine(input));
  print(InputParser().parseLine(input));
}
