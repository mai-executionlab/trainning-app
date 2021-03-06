//logo black white
//bg color light blue
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/theme/assets.dart';
import 'package:training_app/presentation/theme/colors.dart';
import 'package:training_app/presentation/theme/style.dart';

class PreviewFooter extends StatelessWidget {
  const PreviewFooter({
    Key? key,
    this.themeColor,
  }) : super(key: key);
  final int? themeColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 90,
            left: AppStyles.horizontalMargin,
            bottom: 20,
          ),
          child: Image.asset(
            AppAssets.logo,
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
              padding: const EdgeInsets.only(top: 20),
              child: Transform.rotate(
                angle: pi,
                child: Consumer(
                  builder: (context, ref, child) {
                    var color =
                        ref.watch(profileHeaderController).data?.getThemeColor;
                    return CustomPaint(
                      size: const Size(double.maxFinite, 200),
                      painter: ShapeBackgroundPainter(
                          color: color == null
                              ? AppColors.lightBlue
                              : Color(color)),
                    );
                  },
                ),
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
