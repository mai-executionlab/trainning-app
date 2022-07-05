import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/data/data_source/mock.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile_edit/views/profile_setting/profile_setting_controller.dart';
import 'package:training_app/presentation/pages/profile_edit/widgets/common_layout.dart';
import 'package:training_app/presentation/pages/profile_edit/widgets/custom_set.dart';
import 'package:training_app/presentation/pages/profile_edit/widgets/drop_down_selection.dart';
import 'package:training_app/presentation/theme/colors.dart';
import 'package:training_app/presentation/theme/style.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CommonLayout(
        screenTitle: 'プロフィール',
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.horizontalMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '公開設定',
                    style:
                        TextStyles.mediumBold.copyWith(color: AppColors.black),
                  ),
                  Consumer(
                    builder: (context, ref, child) => ToggleButton(
                      left: '非公開にする',
                      right: '公開中',
                      width: 234,
                      isSelected: ref.watch(privacyController),
                      onPressed: (index) => ref
                          .read(privacyController.notifier)
                          .onToggle(index: index),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              /// select language section
              CustomSet(
                label: 'プロフィールの第1言語',
                isRequired: true,
                bilingual: false,
                child: DropDownSelection(list: languages),
              ),
              const SizedBox(height: 50),
              CustomSet(
                label: 'プロフィールの第2言語',
                isRequired: false,
                bilingual: false,
                child: DropDownSelection(list: languages),
              ),

              /// end select language section
              const SizedBox(height: 50),

              /// select avt
              CustomSet(
                label: 'プロフィール画像',
                isRequired: true,
                bilingual: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 17),
                      child: BorderAvatar(
                        size: 90,
                        borderWidth: 1,
                        borderColor: AppColors.greyBorder,
                      ),
                    ),
                    Text(
                      '--MB 未満の jpg, png 画像のみ',
                      style: TextStyles.smallRegular
                          .copyWith(color: AppColors.black),
                    ),
                  ],
                ),
              ),

              /// end select avt
              const SizedBox(height: 50),

              /// select cover photo
              CustomSet(
                label: 'プロフィール背景画像',
                isRequired: true,
                bilingual: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 17),
                      child: Container(
                          decoration: ShapeDecoration(
                              // color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                      color: AppColors.greyBorder))),
                          child: const CoverImage()),
                    ),
                    Text(
                      '--MB 未満の jpg, png 画像のみ',
                      style: TextStyles.smallRegular
                          .copyWith(color: AppColors.black),
                    ),
                  ],
                ),
              ),

              /// end select cover photo
              const SizedBox(height: 50),

              /// username
              CustomSet(
                label: 'プロフィール名',
                isRequired: true,
                controller: TextEditingController(text: '旅行花子'),
              ),

              ///end username
              const SizedBox(height: 50),

              ///gender dropdown
              CustomSet(
                label: '性別',
                isRequired: false,
                bilingual: false,
                child:
                    const DropDownSelection(list: ['Male', 'Female', 'Other']),
              ),

              ///end gender dropdown
              const SizedBox(height: 50),

              ///short title
              CustomSet(
                label: '肩書き',
                isRequired: false,
                controller: TextEditingController(text: '沖縄ネイチャーガイド'),
              ),

              ///end short title
              const SizedBox(height: 50),

              ///phone
              CustomSet(
                label: '性別',
                isRequired: false,
                bilingual: false,
                controller: TextEditingController(text: '090-0000-0000'),
              ),

              ///end phone
              const SizedBox(height: 50),

              ///email
              CustomSet(
                label: '連絡先メールアドレス',
                isRequired: false,
                bilingual: false,
                controller: TextEditingController(text: 'hoge@hoge.com'),
              ),

              ///end email
              const SizedBox(height: 50),

              ///phone
              CustomSet(
                label: 'テーマカラー',
                isRequired: false,
                bilingual: false,
                controller: TextEditingController(text: '#FFFFFF'),
              ),

              ///end phone
              const SizedBox(height: 50),

              ///button section
              PrimaryTextButton(
                text: '保存',
                buttonStyle: ButtonStyles.elevated,
                onPressed: () {},
              ),
              const SizedBox(height: 32),
              PrimaryTextButton(
                text: 'プレビュー',
                buttonStyle: ButtonStyles.outlined,
                onPressed: () {},
              )

              ///end button section
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropDownSelection() => Container(
        // color: AppColors.primaryColor,
        height: 48,
        child: DropDownSelection(),
      );
}

enum ProfileSettingSection {
  privacy,
  language1,
  language2,
  avatarImage,
  coverImage,
}
