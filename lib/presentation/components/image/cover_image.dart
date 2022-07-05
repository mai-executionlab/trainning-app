import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/theme/theme.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    Key? key,
    this.img,
    this.height = 154,
    this.radius = 5,
  }) : super(key: key);
  final String? img;

  final double height;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return img == null || img!.isEmpty
        ? Container(
            height: height,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius)),
                color: AppColors.greyBackground,
                shadows: const [
                  BoxShadow(blurRadius: 3, color: AppColors.greyBorder)
                ]),
            child: Center(
              child: SvgPicture.asset(
                AppAssets.image,
                height: 24,
              ),
            ),
          )
        : NetImage(
            width: double.maxFinite,
            height: height,
            imageUrl: img!,
            radius: radius,
            placeHolder: Container(
              decoration: const BoxDecoration(
                  color: AppColors.greyBackground,
                  boxShadow: [
                    BoxShadow(blurRadius: 3, color: AppColors.greyBorder)
                  ]),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.image,
                  height: 24,
                ),
              ),
            ),
          );
  }
}
