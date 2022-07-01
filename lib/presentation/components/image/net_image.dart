import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:training_app/presentation/theme/colors.dart';

class NetImage extends StatelessWidget {
  const NetImage({
    Key? key,
    required this.width,
    required this.height,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.placeHolder,
    this.errorWidget,
    this.radius,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final BoxFit fit;

  final Widget? placeHolder;
  final Widget? errorWidget;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 5.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        // progressIndicatorBuilder:
        //     (context, url, DownloadProgress downloadProgress) {
        //   debugPrint(downloadProgress.progress.toString());
        //   return Container(
        //     width: width,
        //     height: height,
        //     child: Center(
        //       child: CircularProgressIndicator(
        //         value: downloadProgress.progress,
        //       ),
        //     ),
        //   );
        // },
        placeholderFadeInDuration: const Duration(milliseconds: 500),
        placeholder: (context, url) => Container(
          color: AppColors.greyBackground,
          width: width,
          height: height,
          child: placeHolder,
        ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            SizedBox(
              width: width,
              height: height,
              child: const Center(
                  child: Icon(
                Icons.error_outline_rounded,
                color: AppColors.red,
              )),
            ),
      ),
    );
  }
}
