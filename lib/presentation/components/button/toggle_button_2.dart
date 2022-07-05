import 'package:flutter/material.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ToggleButton2 extends StatelessWidget {
  const ToggleButton2(
      {Key? key,
      required this.left,
      required this.right,
      this.width = 120,
      this.onPressed,
      required this.isSelected})
      : super(key: key);

  final String left;
  final String right;
  final double width;
  final Function(int)? onPressed;
  final List<bool> isSelected;
  @override
  Widget build(BuildContext context) {
    final style = TextStyles.smallBold;
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 20),
      // margin: const EdgeInsets.symmetric(vertical: 20),
      height: 36,
      width: width,
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: ToggleButtons(
        borderWidth: 1,
        borderColor: AppColors.greyBorder,
        selectedBorderColor: AppColors.primaryColor,
        onPressed: onPressed,
        isSelected: isSelected,
        renderBorder: true,
        selectedColor: AppColors.white,
        fillColor: AppColors.primaryColor,
        color: AppColors.grey88,
        borderRadius: BorderRadius.circular(4),
        textStyle: style,
        children: [
          SizedBox(
            width: (width - 4) / 2,
            child: Center(
              child: Text(left),
            ),
          ),
          SizedBox(
            width: (width - 4) / 2,
            child: Center(
              child: Text(right),
            ),
          )
        ],
      ),
    );
  }
}
