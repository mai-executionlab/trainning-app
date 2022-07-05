import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/theme/theme.dart';

class DropDownSelection extends StatelessWidget {
  const DropDownSelection({Key? key, this.height = 48, this.list = const []})
      : super(key: key);

  final double height;
  final List<String> list;
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
        hint: Text(
          '選択してください',
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
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
