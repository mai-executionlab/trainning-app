import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/theme/assets.dart';
import 'package:training_app/presentation/theme/colors.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key? key,
    required this.type,
    this.bgColor = AppColors.white,
    this.iconColor = AppColors.primaryColor,
    this.onPress,
    this.iconAsset,
  }) : super(key: key);

  final CircleIconBtnType type;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback? onPress;
  final String? iconAsset;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: ShapeDecoration(shape: const CircleBorder(), color: bgColor),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPress,
        child: SvgPicture.asset(
          type.icon ?? iconAsset ?? '',
          color: iconColor,
        ),
      ),
    );
  }
}

enum CircleIconBtnType {
  back,
  add,
  close,
  other,
}

extension CircleIconBtnTypeExtension on CircleIconBtnType {
  String? get icon {
    switch (this) {
      case CircleIconBtnType.back:
        return AppAssets.leftArrow;
      case CircleIconBtnType.add:
        return AppAssets.addOutlined;
      case CircleIconBtnType.close:
        return AppAssets.close;
      default:
        return null;
    }
  }
}
