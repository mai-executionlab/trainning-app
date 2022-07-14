import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/theme/theme.dart';

class SpotItem extends StatelessWidget {
  const SpotItem({
    Key? key,
    this.img,
    this.title,
    this.content,
    this.location,
  }) : super(key: key);
  final String? img;
  final String? title;
  final String? content;
  final String? location;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          shadows: [
            BoxShadow(blurRadius: 2, color: AppColors.black.withOpacity(0.2))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Column(
          children: [
            if (img != null)
              NetImage(
                  width: double.maxFinite,
                  height: 218,
                  imageUrl: img ?? '',
                  radius: 0),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppAssets.spot, height: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      formatTitle(location: location, title: title),
                      // '$location - $title',
                      style: TextStyles.largeBold
                          .copyWith(color: AppColors.customizeFG),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppStyles.horizontalMargin),
              // child: Text(
              //   content ?? '',
              child: HtmlWidget(content ?? ''),
              //   style: TextStyles.mediumRegular
              //       .copyWith(color: AppColors.black, height: 25 / 14),
              // ),
              // child:
              // child: Html(data: content ?? ''),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  String formatTitle({String? location, String? title}) {
    if (location != null && title != null) return '$location - $title';
    return location ?? title ?? '';
  }
}
