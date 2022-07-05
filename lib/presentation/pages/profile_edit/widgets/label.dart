import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_app/presentation/theme/colors.dart';
import 'package:training_app/presentation/theme/style.dart';

class Label extends StatelessWidget {
  const Label({
    Key? key,
    required this.label,
    this.isRequired,
  }) : super(key: key);

  final String label;
  final bool? isRequired;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyles.mediumBold.copyWith(color: AppColors.black),
        ),
        const SizedBox(width: 16),
        if (isRequired != null) TagType(isRequired: isRequired!)
      ],
    );
  }
}

class TagType extends StatelessWidget {
  const TagType({
    Key? key,
    required this.isRequired,
  }) : super(key: key);

  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isRequired ? '必須' : '任意',
            style: isRequired
                ? TextStyles.smallBold.copyWith(color: AppColors.primaryColor)
                : TextStyles.smallRegular.copyWith(color: AppColors.black33)),
        Container(
          width: 26,
          height: 2,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              color: isRequired ? AppColors.primaryColor : AppColors.grey88),
        )
      ],
    );
  }
}
