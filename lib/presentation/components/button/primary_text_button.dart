import 'package:flutter/cupertino.dart';
import 'package:training_app/presentation/theme/theme.dart' as theme;

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    this.buttonStyle,
    this.onPressed,
  }) : super(key: key);

  final double height;
  final double width;
  final String text;
  final theme.ButtonStyle? buttonStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: buttonStyle?.bgColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: const BorderSide(color: theme.AppColors.primaryColor)),
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        onPressed: onPressed,
        child: Text(
          text,
          style: buttonStyle?.textStyle,
        ),
      ),
    );
  }
}
