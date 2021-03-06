import 'package:flutter/material.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton(
      {Key? key,
      required this.left,
      required this.right,
      required this.width,
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
    final style = TextStyles.mediumRegular;
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 40,
      width: width,
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: ToggleButtons(
        borderColor: AppColors.greyBorder,
        selectedBorderColor: AppColors.primaryColor,
        onPressed: onPressed,
        isSelected: isSelected,
        renderBorder: true,
        selectedColor: AppColors.primaryColor,
        fillColor: AppColors.primaryColor.withOpacity(0.1),
        color: AppColors.black,
        borderRadius: BorderRadius.circular(4),
        textStyle: style,
        children: [
          SizedBox(
            width: (width - 4) / 2,
            child: Center(
              child: Text(
                left,
                style: style.copyWith(
                    fontWeight:
                        isSelected[0] ? FontWeight.w700 : FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            width: (width - 4) / 2,
            child: Center(
              child: Text(right,
                  style: style.copyWith(
                      fontWeight:
                          isSelected[1] ? FontWeight.w700 : FontWeight.w400)),
            ),
          )
        ],
      ),
    );
  }
}
