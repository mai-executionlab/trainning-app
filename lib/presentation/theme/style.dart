import 'package:flutter/material.dart';
import 'package:training_app/presentation/theme/colors.dart';

class TextStyles {
  TextStyles._();
  static const TextStyle _small =
      TextStyle(fontSize: 12, color: AppColors.black);

  static const TextStyle _medium =
      TextStyle(fontSize: 14, color: AppColors.black);

  static const TextStyle _large =
      TextStyle(fontSize: 16, color: AppColors.black);

  //medium size 14
  static TextStyle get mediumRegular =>
      _medium.copyWith(fontWeight: FontWeight.w400);

  static TextStyle get mediumBold =>
      _medium.copyWith(fontWeight: FontWeight.w700);

  //small size 12
  static TextStyle get smallRegular =>
      _small.copyWith(fontWeight: FontWeight.w400);

  //large size 16
  static TextStyle get largeBold =>
      _large.copyWith(fontWeight: FontWeight.w700);

  // static TextStyle get buttonText =>
  // _large.copyWith(fontWeight: FontWeight.w700);
  // static TextStyle get buttonText =>
  // _large.copyWith(fontWeight: FontWeight.w700);
}

class AppStyles {
  AppStyles._();
  static const borderRadius = 3.0;
  static const horizontalMargin = 25.0;
}

////////////////////////-BUTTON-///////////////////////
class ButtonStyle {
  ButtonStyle({
    this.textStyle,
    this.bgColor,
  });
  final TextStyle? textStyle;
  final Color? bgColor;
}

class ButtonStyles {
  ButtonStyles._();
  static ButtonStyle get elevated => ButtonStyle(
        textStyle: TextStyles.mediumBold.copyWith(color: AppColors.white),
        bgColor: AppColors.primaryColor,
      );

  static ButtonStyle get outlined => ButtonStyle(
        textStyle:
            TextStyles.mediumBold.copyWith(color: AppColors.primaryColor),
        bgColor: AppColors.white,
      );
}
