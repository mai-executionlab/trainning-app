import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/pages/profile_edit/views/index.dart';
import 'package:training_app/presentation/pages/profile_edit/views/profile_edit/profile_edit_controller.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({
    Key? key,
    this.onTapSetting,
    // required this.account,
    // required this.currentLanguage,
  }) : super(key: key);

  final VoidCallback? onTapSetting;
  // final Account account;
  // final List<String> currentLanguage;
  @override
  Widget build(BuildContext context, ref) {
    final GlobalKey<ScaffoldState> globalKey = GlobalKey();
    final currentLanguage = ref.watch(languageController);
    final Account? account = ref.watch(profileHeaderController).data;
    Size size = MediaQuery.of(context).size;
    // print(account?.profileThemeColor);
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              // size: Size.square(size.width),
              painter: ShapeBackgroundPainter(
                  color: account?.getThemeColor == null
                      ? AppColors.lightBlue
                      : Color(account!.getThemeColor!)),
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
                  // width: 71 * 2,
                  decoration: ShapeDecoration(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: Consumer(
                    builder: (context, ref, child) {
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
                          Container(
                            // width: 71,
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Center(
                              child: Text(
                                account?.primaryLanguage?.name ?? '',
                                style:
                                    TextStyles.smallBold.copyWith(fontSize: 13),
                              ),
                            ),
                          ),
                          Container(
                            // width: 71,
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Center(
                              child: Text(
                                (account?.secondaryLanguage?.name ?? ''),
                                style: TextStyles.smallRegular
                                    .copyWith(fontSize: 13),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
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
                      img: account?.coverImageUrl,
                    ),
                  ),
                  Positioned(
                      left: AppStyles.horizontalMargin - 3,
                      bottom: 0,
                      child: BorderAvatar(
                        size: 90,
                        imageUrl: account?.avatarUrl,
                      )),
                  Positioned(
                    bottom: 0,
                    right: AppStyles.horizontalMargin + 10,
                    child: SizedBox(
                      height: 20,
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: onTapSetting ??
                            () async {
                              ref
                                  .read(profileEditController.notifier)
                                  .fetchData();
                              var result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => const ProfileEdit()));

                              if (result == true) {
                                print('reload');
                                ref
                                    .read(profileHeaderController.notifier)
                                    .init();
                              }
                            },
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
                              style: TextStyles.smallRegular.copyWith(
                                  color: AppColors.black33, height: 1),
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
                            account?.nickname?[currentLanguage[0]] ?? '',
                            style: TextStyles.extraLargeBold,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            account?.nickname?[currentLanguage[1]] ?? '',
                            style: TextStyles.smallRegular.copyWith(
                                color: AppColors.black.withOpacity(0.8)),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            account?.title?[currentLanguage[0]] ?? '',
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
      ),
    );
  }
}
