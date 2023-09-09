import 'package:calculator_app/theme/theme.dart';

class AppThemeData {
  final GradientsThemeData gradients;
  final ColorsThemeData colors;
  final TextStylesThemeData textStyles;

  const AppThemeData._({
    required this.gradients,
    required this.colors,
    required this.textStyles,
  });

  factory AppThemeData.light() {
    return AppThemeData._(
      gradients: GradientsThemeData.light(),
      colors: ColorsThemeData.light(),
      textStyles: TextStylesThemeData.light(),
    );
  }
  factory AppThemeData.dark() {
    return AppThemeData._(
      gradients: GradientsThemeData.dark(),
      colors: ColorsThemeData.dark(),
      textStyles: TextStylesThemeData.light(),
    );
  }
}
