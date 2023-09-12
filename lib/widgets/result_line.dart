import 'package:flutter/material.dart';

import '../theme/app_theme_data.dart';

class ResultLine extends StatelessWidget {
  const ResultLine({super.key, required this.result});
  final String result;

  @override
  Widget build(BuildContext context) {
    final tempTheme = AppThemeData.light();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text(
        result.isNotEmpty ? '=$result' : ' ',
        style: tempTheme.textStyles.result
            .copyWith(color: tempTheme.colors.result),
        maxLines: 1,
      ),
    );
  }
}
