import 'package:flutter/material.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ToggleButton2 extends StatelessWidget {
  const ToggleButton2(
      {Key? key,
      required this.left,
      required this.right,
      // this.width = 120,
      this.onPressed,
      required this.isSelected})
      : super(key: key);

  final String left;
  final String right;
  // final double width;
  final Function(int)? onPressed;
  final List<bool> isSelected;
  @override
  Widget build(BuildContext context) {
    final style = TextStyles.smallBold;
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 20),
      // margin: const EdgeInsets.symmetric(vertical: 20),
      // constraints: BoxConstraints.expand(
      //     width: MediaQuery.of(context).size.width / 2 - 20),
      height: 36,
      width: MediaQuery.of(context).size.width / 2 - 10,
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: LayoutBuilder(builder: (context, constraints) {
        return Wrap(
          textDirection: TextDirection.rtl,
          direction: Axis.vertical,
          children: [
            ToggleButtons(
              borderWidth: 1,
              constraints: BoxConstraints(
                  maxHeight: 36,
                  minHeight: 36,
                  minWidth: constraints.maxWidth / 2,
                  maxWidth: constraints.maxWidth / 2),
              borderColor: AppColors.greyBorder,
              selectedBorderColor: AppColors.primaryColor,
              onPressed: onPressed,
              isSelected: isSelected,
              renderBorder: true,
              selectedColor: AppColors.white,
              fillColor: AppColors.primaryColor,
              color: AppColors.grey88,
              borderRadius: BorderRadius.circular(4),
              textStyle: style.copyWith(overflow: TextOverflow.ellipsis),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(left),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(right),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
