import 'package:flutter/material.dart';
import 'package:training_app/presentation/theme/colors.dart';
import 'package:training_app/presentation/theme/style.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.controller,
    this.length,
    this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final int? length;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: AppColors.greyBorder,
        ));
    return Center(
      child: TextField(
        controller: controller,
        // initialValue: controller.text,
        style: TextStyles.largRegular.copyWith(
          height: 23 / 16,
          color: AppColors.black,
          // backgroundColor: AppColors.primaryColor,
        ),
        maxLength: length,
        decoration: InputDecoration(
          hintText: hint,
          counterStyle: TextStyles.mediumBold,
          hintStyle: TextStyles.largRegular.copyWith(
            height: 23 / 16,
            color: AppColors.greyTextPlaceholder,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
