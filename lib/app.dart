import 'package:calculator_app/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1,
              boldText: false,
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
