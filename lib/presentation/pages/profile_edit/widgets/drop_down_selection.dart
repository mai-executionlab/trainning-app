import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/theme/theme.dart';

class DropDownSelection<T> extends StatelessWidget {
  const DropDownSelection({
    Key? key,
    this.height = 48,
    this.list = const [],
    this.hint,
    this.onChange,
    this.initValue,
  }) : super(key: key);

  final double height;
  final List<T> list;
  final String? hint;
  final Function(T?)? onChange;
  final T? initValue;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: AppColors.greyBorder,
      ),
    );
    return SizedBox(
      height: height,
      child: DropdownButtonFormField(
        value: initValue,
        hint: Text(
          hint == null || hint!.isEmpty ? '選択してください' : hint!,
          style: TextStyles.largRegular.copyWith(color: AppColors.black),
        ),
        icon: SvgPicture.asset(
          AppAssets.downArrow,
          color: const Color(0xFF777777),
        ),
        style: TextStyles.largRegular.copyWith(color: AppColors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          // border: border,
          enabledBorder: border, focusedBorder: border,
        ),
        items: list
            .map((e) => DropdownMenuItem<T>(
                  value: e,
                  child: Text(e is Language
                      ? e.name!
                      : e is Gender
                          ? e.getValue
                          : e.toString()),
                ))
            .toList(),
        onChanged: onChange,
      ),
    );
  }
}
