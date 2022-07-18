import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/controller.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/pages/profile_edit/views/profile_edit/profile_edit_controller.dart';
import 'package:training_app/presentation/pages/profile_edit/widgets/index.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileEdit extends ConsumerStatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends ConsumerState<ProfileEdit> {
  late TextEditingController nicknameController1;
  late TextEditingController nicknameController2;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController titleController1;
  late TextEditingController titleController2;

  late TextEditingController themeColorController;


  @override
  void dispose() {
    nicknameController1.dispose();
    nicknameController2.dispose();
    emailController.dispose();
    phoneController.dispose();
    titleController1.dispose();
    titleController2.dispose();
    themeColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listLanguage = ref.watch(languagesProvider).value?.list ?? [];
    // print(languages);
    final Account? account = ref.watch(profileEditController).data;

    ref.listen<PageStatus>(
      profileEditController,
      (previous, next) {
        if (next.state == PageState.loaded) {
   
          ref.read(primaryLanguageProvider.notifier).state =
              next.data?.primaryLanguage;
          ref.read(secondaryLanguageProvider.notifier).state =
              next.data?.secondaryLanguage;
        }
      },
    );

    nicknameController1 = TextEditingController(
        text: account?.nickname?[account.primaryLanguage?.code]);

    nicknameController2 = TextEditingController(
        text: account?.nickname?[account.secondaryLanguage?.code]);

    emailController = TextEditingController(text: account?.contactEmail);

    phoneController = TextEditingController(text: account?.phoneNumber);

    titleController1 = TextEditingController(
        text: account?.title?[account.primaryLanguage?.code]);

    titleController2 = TextEditingController(
        text: account?.title?[account.secondaryLanguage?.code]);

    themeColorController =
        TextEditingController(text: account?.profileThemeColor);

    final privacy = privacyController.call(account?.publishing ?? false);
    String? gender = account?.gender;


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
                  ToggleButton(
                    left: '非公開にする',
                    right: '公開中',
                    width: 234,
                    isSelected: ref.watch(privacy),
                    onPressed: (index) =>
                        ref.read(privacy.notifier).onToggle(index: index),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              /// select language section
              CustomSet(
                label: 'プロフィールの第1言語',
                // label: ref.watch(chooseLanguage)?.name ?? '',
                isRequired: true,
                child: DropDownSelection<Language>(
                  list: listLanguage,
                  hint: account?.primaryLanguage?.name,
                  onChange: (value) {
                    ref.read(primaryLanguageProvider.notifier).state = value;
                    // chooseLanguage[0] = value;
                  },
                  // list: [],
                ),
              ),
              const SizedBox(height: 50),
              CustomSet(
                label: 'プロフィールの第2言語',
                isRequired: false,
                child: DropDownSelection<Language>(
                  list: listLanguage,
                  // initValue: account?.secondaryLanguage,
                  hint: account?.secondaryLanguage?.name,
                  onChange: (value) {
                    ref.read(secondaryLanguageProvider.notifier).state = value;
                  },
                  // list: [],
                ),
              ),

              /// end select language section
              const SizedBox(height: 50),

              /// select avt
              CustomSet(
                label: 'プロフィール画像',
                isRequired: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 17),
                      child: BorderAvatar(
                        size: 90,
                        borderWidth: 1,
                        borderColor: AppColors.greyBorder,
                        imageUrl: ref
                            .watch<PageStatus<Account>>(profileHeaderController)
                            .data
                            ?.avatarUrl,
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
                          child: CoverImage(
                            img: ref
                                .watch<PageStatus<Account>>(
                                    profileHeaderController)
                                .data
                                ?.coverImageUrl,
                          )),
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
              CustomToggleSet(
                label: 'プロフィール名',
                isRequired: true,
                // controller: TextEditingController(text: '旅行花子'),
                controller1: nicknameController1,
                controller2: nicknameController2,
                toggleController: nicknameToggleLanguage,
                value: account?.nickname,
              ),

              ///end username
              const SizedBox(height: 50),

              ///gender dropdown
              CustomSet(
                label: '性別',
                isRequired: false,
                child: DropDownSelection<Gender>(
                  initValue: account?.mapGender(),
                  list: Gender.values,
                  onChange: (value) {
                    gender = value?.name;
                    // print(value?.name);
                  },
                ),
              ),

              ///end gender dropdown
              const SizedBox(height: 50),

              ///short title
              CustomToggleSet(
                label: '肩書き',
                isRequired: false,
                controller1: titleController1,
                controller2: titleController2,
                toggleController: catchyToggleLanguage,
                value: account?.catchPharse,
              ),

              ///end short title
              const SizedBox(height: 50),

              ///phone
              CustomSet(
                label: '性別',
                isRequired: false,
                controller: phoneController,
              ),

              ///end phone
              const SizedBox(height: 50),

              ///email
              CustomSet(
                label: '連絡先メールアドレス',
                isRequired: false,
                controller: emailController,
              ),

              ///end email
              const SizedBox(height: 50),

              ///theme color
              CustomSet(
                label: 'テーマカラー',
                isRequired: false,
                // controller:
                //     TextEditingController(text: account?.profileThemeColor),
                child: InputText(
                  controller: themeColorController,
                  onTap: () async {
                    String? newColor = await showDialog(
                        context: context,
                        builder: (context) {
                          return colorDialog(
                            Color(themeColorController.text.colorValue ??
                                AppColors.lightBlue.value),
                          );
                        });
                    if (newColor != null) themeColorController.text = newColor;
                  },
                ),
              ),

              ///end phone
              const SizedBox(height: 50),

              ///button section
              PrimaryTextButton(
                text: '保存',
                buttonStyle: ButtonStyles.elevated,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const LoadingDialog());
                  final primaryLanguage =
                      ref.watch(primaryLanguageProvider)?.code;
                  final secondaryLanguage =
                      ref.watch(secondaryLanguageProvider)?.code;
                  Map<String, dynamic> body = {
                    'publishing': !ref.read(privacy)[0],
                    "title": {
                      primaryLanguage: titleController1.text,
                      secondaryLanguage: titleController2.text,
                    },
                    "nickname": {
                      primaryLanguage: nicknameController1.text,
                      secondaryLanguage: nicknameController2.text,
                    },
                    "gender": gender,
                    "phone_number": phoneController.text,
                    "contact_email": emailController.text,
                    "profile_theme_color": themeColorController.text,
                    "primary_language_code": primaryLanguage,
                    "secondary_language_code": secondaryLanguage,
                  };

       
                  ref
                      .read(guideRepoProvider)
                      .updateUserInfor(body: body)
                      .then((value) {
    
                    Navigator.of(context).pop();
                    if (value.object == true) {
               
                      Navigator.of(context).pop(true);
                    }
                  });

                },
              ),
              const SizedBox(height: 32),

              //preview button
              PrimaryTextButton(
                text: 'プレビュー',
                buttonStyle: ButtonStyles.outlined,
                onPressed: () {},
              ),

              ///end button section
            ],
          ),
        ),
      ),
    );
  }

  Widget colorDialog(Color current) {
    // TextEditingController colorController = TextEditingController();
    String? newColor;
    return Dialog(
      // backgroundColor: AppColors.grey88,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      // alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          '色を選択してください',
                          style: TextStyles.largeBold.copyWith(height: 1),
                        ),
                      ),
                    ),
                    CircleIconButton(
                      type: CircleIconBtnType.close,
                      onPress: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              ),
              ColorPicker(
                enableAlpha: false,
                pickerColor: current,
                //  Color(
                // account?.getThemeColor ?? AppColors.lightBlue.value),
                onColorChanged: (color) {
                  // print(color.value.toRadixString(16));
                  // print(account?.profileThemeColor);
                  newColor = color.value.toRadixString(16);
                },
                colorPickerWidth: 300,
                labelTypes: const [],
                hexInputBar: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
                child: PrimaryTextButton(
                  text: 'Choose',
                  buttonStyle: ButtonStyles.elevated,
                  onPressed: () {
                    Navigator.of(context).pop('#${newColor?.substring(2)}');
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
