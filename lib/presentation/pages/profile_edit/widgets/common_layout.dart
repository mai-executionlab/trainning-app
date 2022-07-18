import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/theme/theme.dart';

class CommonLayout extends StatelessWidget {
  const CommonLayout({
    Key? key,
    required this.child,
    required this.screenTitle,
  }) : super(key: key);

  final Widget child;
  final String screenTitle;
  @override
  Widget build(BuildContext context) {
    // Size size
    return SafeArea(
      child: ListView(
        children: [
          Container(
            height: 64,
            // color: AppColors.lightBlue,
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.horizontalMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SvgPicture.asset(AppAssets.markColor),
                SizedBox(
                  height: 34,
                  child: Image.asset(AppAssets.mark),
                ),
                InkWell(
                  // onTap: () => globalKey.currentState?.openEndDrawer(),
                  child: SizedBox(
                    height: 18,
                    child: SvgPicture.asset(AppAssets.menu),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 24,
            endIndent: 24,
            height: 1,
            thickness: 1,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18),
            height: 44,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    screenTitle,
                    style: TextStyles.largeBold
                        .copyWith(color: AppColors.black, height: 1),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: CircleIconButton(
                    type: CircleIconBtnType.back,
                    // bgColor: AppColors.brand2,
                    onPress: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
          ),
          child,
          const EditFooter(),
        ],
      ),
    );
  }
}
