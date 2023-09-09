import 'package:calculator_app/theme/app_theme_data.dart';
import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final systemPadding = MediaQuery.paddingOf(context);
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppThemeData.light().gradients.backgroundGradient,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            systemPadding.left,
            systemPadding.top,
            systemPadding.right,
            systemPadding.bottom,
          ),
          child: SizedBox.expand(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .3,
                ),
                Expanded(
                  child: Container(
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
