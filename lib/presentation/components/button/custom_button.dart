import 'package:flutter/cupertino.dart';
import 'package:training_app/presentation/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.height = 52,
    this.width = 44,
    this.bgColor,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final double height;
  final double width;
  final Color? bgColor;
  final Widget icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: bgColor ?? AppColors.white,
          shadows: bgColor == null
              ? [
                  BoxShadow(
                      blurRadius: 2, color: AppColors.black.withOpacity(0.25))
                ]
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: CupertinoButton(
            padding: EdgeInsets.zero,
            // color: bgColor ?? AppColors.white,
            onPressed: onPressed,
            child: icon));
  }
}
