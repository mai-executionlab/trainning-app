import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/theme/theme.dart';

class EditFooter extends StatelessWidget {
  const EditFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Divider(
          thickness: 1,
          color: AppColors.grey,
          indent: AppStyles.horizontalMargin,
          endIndent: AppStyles.horizontalMargin,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 40, left: AppStyles.horizontalMargin, bottom: 20),
          child: Image.asset(
            AppAssets.logoColor,
            width: 120,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, right: 35, bottom: 12),
          child: Text(
            '''ホーム
ナビテキストA
ナビテキストテキストテキストB
ナビテキストテキストC
ナビテキストD
ナビテキストテキストE''',
            style: TextStyles.mediumRegular.copyWith(height: 40 / 14),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                height: 77,
                color: AppColors.grey,
              ),
            ),
            Positioned(
              right: AppStyles.horizontalMargin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomButton(
                    height: 48,
                    icon: SvgPicture.asset(AppAssets.upDoubleArrow),
                    bgColor: AppColors.white,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 15),
                  Text(
                    AppAssets.footerText,
                    style: TextStyles.smallRegular,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
