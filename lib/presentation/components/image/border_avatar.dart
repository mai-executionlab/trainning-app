import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/theme/theme.dart';

class BorderAvatar extends StatelessWidget {
  const BorderAvatar({
    Key? key,
    required this.size,
    this.imageUrl,
    this.borderColor = AppColors.white,
    this.borderWidth = 3.0,
  }) : super(key: key);
  final double size;
  final String? imageUrl;
  final Color borderColor;
  final double borderWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: borderColor,
        shape: CircleBorder(
          side: BorderSide(width: borderWidth, color: borderColor),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: imageUrl == null || imageUrl!.isEmpty
            ? SizedBox(
                height: size,
                width: size,
                // color: AppColors.greyBackground,
                // child: Center(
                //   child: SvgPicture.asset(
                //     AppAssets.user,
                //     height: 24,
                //   ),
                // ),
              )
            : NetImage(
                height: size,
                width: size,
                imageUrl: imageUrl ?? '',
                placeHolder: Container(
                  color: AppColors.greyBackground,
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.user,
                      height: 24,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
