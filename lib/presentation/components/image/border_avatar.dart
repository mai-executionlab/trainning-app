import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/theme/theme.dart';

class BorderAvatar extends StatelessWidget {
  const BorderAvatar({
    Key? key,
    required this.size,
    required this.imageUrl,
    this.borderColor = AppColors.white,
  }) : super(key: key);
  final double size;
  final String imageUrl;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: borderColor,
        shape: CircleBorder(
          side: BorderSide(width: 3, color: borderColor),
        ),
      ),
      child: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: NetImage(
          height: size - 6,
          width: size - 6,
          imageUrl: imageUrl,
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
      )),
    );
  }
}
