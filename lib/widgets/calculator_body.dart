import 'dart:math';

import 'package:calculator_app/theme/app_theme_data.dart';
import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculatorBody extends StatelessWidget {
  const CalculatorBody({
    super.key,
    required this.onTileTap,
    required this.onClearTap,
    required this.onClearLongTap,
  });
  final void Function(String value) onTileTap;
  final void Function() onClearTap;
  final void Function() onClearLongTap;

  @override
  Widget build(BuildContext context) {
    final tempTheme = AppThemeData.light();

    return LayoutBuilder(
      builder: (context, constr) {
        final horizontalGap = constr.maxWidth * 0.02;
        final aboveNumbersGap = constr.maxHeight * 0.025;
        final belowNumbersGap = constr.maxHeight * 0.03;

        final normalWidth = ((constr.maxWidth - horizontalGap * 3) / 4) - .5;
        final normalHeight = ((constr.maxHeight -
                    aboveNumbersGap -
                    belowNumbersGap -
                    2 * horizontalGap) /
                5) -
            .5;

        final finalButtonHeight = min(normalHeight, normalWidth);
        final standSize = Size(finalButtonHeight, finalButtonHeight);

        final zeroButtonWidth = finalButtonHeight * 2 + horizontalGap;
        final plusButtonHeight = finalButtonHeight * 2 * .79;
        final plusButtonTopOffset =
            2 * finalButtonHeight + aboveNumbersGap + horizontalGap;
        final plusButtonBottomOffset = constr.maxHeight -
            (finalButtonHeight * 5 +
                aboveNumbersGap +
                belowNumbersGap +
                2 * horizontalGap);

        return Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Wrap(
                    spacing: horizontalGap,
                    children: [
                      FunctionalButton(
                        size: standSize,
                        onTap: onClearTap,
                        onLongTap: onClearLongTap,
                        child: Icon(
                          Icons.backspace_outlined,
                          size: 27,
                          color: tempTheme.colors.operation,
                        ),
                      ),
                      OperationButton(
                        size: standSize,
                        value: '%',
                        onTap: onTileTap,
                      ),
                      OperationButton(
                        size: standSize,
                        value: '/',
                        onTap: onTileTap,
                      ),
                      OperationButton(
                        size: standSize,
                        value: '*',
                        onTap: onTileTap,
                      ),
                    ],
                  ),
                  SizedBox(height: aboveNumbersGap),
                  Wrap(
                    spacing: horizontalGap,
                    children: [
                      NumberButton(
                        size: standSize,
                        value: '7',
                        onTap: onTileTap,
                      ),
                      NumberButton(
                        size: standSize,
                        value: '8',
                        onTap: onTileTap,
                      ),
                      NumberButton(
                        size: standSize,
                        value: '9',
                        onTap: onTileTap,
                      ),
                      OperationButton(
                        size: standSize,
                        value: '-',
                        onTap: onTileTap,
                      ),
                    ],
                  ),
                  SizedBox(height: horizontalGap),
                  Wrap(
                    spacing: horizontalGap,
                    children: [
                      NumberButton(
                        size: standSize,
                        value: '4',
                        onTap: onTileTap,
                      ),
                      NumberButton(
                        size: standSize,
                        value: '5',
                        onTap: onTileTap,
                      ),
                      NumberButton(
                        size: standSize,
                        value: '6',
                        onTap: onTileTap,
                      ),
                      SizedBox.fromSize(size: standSize),
                    ],
                  ),
                  SizedBox(height: horizontalGap),
                  Wrap(
                    spacing: horizontalGap,
                    children: [
                      NumberButton(
                        size: standSize,
                        value: '1',
                        onTap: onTileTap,
                      ),
                      NumberButton(
                        size: standSize,
                        value: '2',
                        onTap: onTileTap,
                      ),
                      NumberButton(
                        size: standSize,
                        value: '3',
                        onTap: onTileTap,
                      ),
                      SizedBox.fromSize(size: standSize),
                    ],
                  ),
                  SizedBox(height: belowNumbersGap),
                  Wrap(
                    spacing: horizontalGap,
                    children: [
                      NumberButton(
                        size: Size(zeroButtonWidth, finalButtonHeight),
                        value: '0',
                        onTap: onTileTap,
                      ),
                      NumberButton(
                        size: standSize,
                        value: '.',
                        onTap: onTileTap,
                      ),
                      SizedBox.fromSize(size: standSize),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: plusButtonTopOffset,
                child: OperationButton(
                  value: '+',
                  onTap: onTileTap,
                  size: Size(finalButtonHeight, plusButtonHeight),
                ),
              ),
              Positioned(
                right: 0,
                bottom: plusButtonBottomOffset,
                child: OperationButton(
                  value: '=',
                  onTap: (val) {},
                  size: Size(finalButtonHeight, plusButtonHeight),
                  backgroundGradient: tempTheme.gradients.equalsButton,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
