import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/theme/assets.dart';
import 'package:training_app/presentation/theme/colors.dart';
import 'package:training_app/presentation/theme/style.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({
    Key? key,
    this.title,
    this.level,
  }) : super(key: key);
  final String? title;
  final String? level;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.only(left: 16, right: 26),
      decoration: ShapeDecoration(
          color: AppColors.white,
          shadows: [
            BoxShadow(blurRadius: 2, color: AppColors.black.withOpacity(0.2))
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.skill,
            color: AppColors.yellow,
            height: 24,
          ),
          const SizedBox(width: 13),
          Expanded(
              child: Text(
            title ?? '',
            style: TextStyles.largRegular.copyWith(color: AppColors.black),
          )),
          Text(
            level ?? '',
            style: TextStyles.largeBold.copyWith(color: AppColors.black),
          )
        ],
      ),
    );
  }
}
