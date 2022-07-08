import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/domain/entities/account.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({
    Key? key,
    this.onTapSetting,
    required this.account,
    required this.currentLanguage,
  }) : super(key: key);

  final VoidCallback? onTapSetting;
  final Account account;
  final String currentLanguage;
  @override
  Widget build(BuildContext context, ref) {
    final GlobalKey<ScaffoldState> globalKey = GlobalKey();
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            // size: Size.square(size.width),
            painter: ShapeBackgroundPainter(color: AppColors.lightBlue),
          ),
        ),
        Column(
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
                    onTap: () => globalKey.currentState?.openEndDrawer(),
                    child: SizedBox(
                      height: 18,
                      child: SvgPicture.asset(AppAssets.menu),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: AppStyles.horizontalMargin,
              endIndent: AppStyles.horizontalMargin,
              height: 1,
              thickness: 1,
            ),
            ///////////////language toggle button
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                // padding: const EdgeInsets.symmetric(vertical: 20),
                margin: const EdgeInsets.symmetric(
                    horizontal: AppStyles.horizontalMargin, vertical: 20),
                height: 28,
                width: 71 * 2,
                decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                child: Consumer(builder: (context, ref, child) {
                  return ToggleButtons(
                      // borderColor: AppColors.white,
                      onPressed: (index) {
                        final current = ref.watch(toggleLanguageController);
                        if (!current[index]) {
                          ref
                              .read(toggleLanguageController.notifier)
                              .onToggle(index: index);
                        }
                      },
                      isSelected: ref.watch(toggleLanguageController),
                      renderBorder: false,
                      selectedColor: AppColors.white,
                      fillColor: AppColors.black,
                      color: const Color(0xFF666666),
                      borderRadius: BorderRadius.circular(4),
                      children: [
                        SizedBox(
                          width: 71,
                          child: Center(
                            child: Text(
                              account.primaryLanguage?.name ?? '',
                              style:
                                  TextStyles.smallBold.copyWith(fontSize: 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 71,
                          child: Center(
                            child: Text(
                              account.secondaryLanguage?.name ?? '',
                              style: TextStyles.smallRegular
                                  .copyWith(fontSize: 13),
                            ),
                          ),
                        )
                      ]);
                }),
              ),
            ),
            ///////////////end language toggle button
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 31,
                    left: AppStyles.horizontalMargin,
                    right: AppStyles.horizontalMargin,
                  ),
                  child: CoverImage(
                    img: account.coverImageUrl,
                  ),
                ),
                Positioned(
                    left: AppStyles.horizontalMargin - 3,
                    bottom: 0,
                    child: BorderAvatar(
                      size: 90,
                      imageUrl: account.avatarUrl,
                    )),
                Positioned(
                  bottom: 0,
                  right: AppStyles.horizontalMargin + 10,
                  child: SizedBox(
                    height: 20,
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: onTapSetting,
                      // color: AppColors.white,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.settings,
                            size: 16,
                            color: AppColors.black33,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'プロフィール編集',
                            style: TextStyles.smallRegular
                                .copyWith(color: AppColors.black33, height: 1),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppStyles.horizontalMargin),
              child: Row(
                children: [
                  Expanded(
                    ///user infor
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          account.nickname?[currentLanguage] ?? '',
                          style: TextStyles.extraLargeBold,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          account.nickname?['en'] ?? '',
                          style: TextStyles.smallRegular.copyWith(
                              color: AppColors.black.withOpacity(0.8)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          account.title?[currentLanguage] ?? '',
                          style: TextStyles.mediumBold,
                        )
                      ],
                    ),
                  ),

                  /// end user infor

                  CustomButton(
                    icon: SvgPicture.asset(AppAssets.phoneOutlined),
                  ),
                  const SizedBox(width: 16),
                  CustomButton(
                    icon: SvgPicture.asset(AppAssets.emailOutlined),
                  )
                ],
              ),
            ),
            const SizedBox(height: 43)
          ],
        ),
      ],
    );
  }
}
