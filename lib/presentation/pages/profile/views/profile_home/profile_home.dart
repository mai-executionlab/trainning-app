import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:training_app/domain/entities/entity.dart';

import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/pages/profile/views/profile_home/profile_home_controller.dart';
import 'package:training_app/presentation/pages/profile/widgets/profile_header.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileHome extends ConsumerWidget {
  const ProfileHome({
    Key? key,
    // this.generalInfor,
  }) : super(key: key);

  // final GeneralInformation? generalInfor;
  @override
  Widget build(BuildContext context, ref) {
    final GeneralInformation? generalInfor = ref.watch(profileHomeController);
    ref.watch(profileHomeController.notifier).repositoryImpl;
    final currentLanguageCode = ref.watch(languageController);
    print(generalInfor?.travelOrganization);
    Widget matchItem(GeneralInfor infor) {
      switch (infor.inputType) {
        case 'image':
          return NetImage(
              width: double.maxFinite,
              height: 218,
              imageUrl: infor.mediaUrl ?? '');
        case 'heading':
          return infor.value?[currentLanguageCode.first] != null
              ? Text(
                  infor.value?[currentLanguageCode.first] ?? '',
                  style: TextStyles.mediumBold.copyWith(color: AppColors.black),
                )
              : const SizedBox();
        case 'description':
          return infor.value?[currentLanguageCode.first] != null
              ? HtmlWidget(infor.value?[currentLanguageCode.first] ?? '')
              // ? Text(
              //     infor.value?[currentLanguageCode.first] ?? '',
              //     style: TextStyles.mediumRegular
              //         .copyWith(height: 20 / 14, color: AppColors.brand2),
              //   )
              : const SizedBox();

        default:
          return const SizedBox();
      }
    }

    return ListView(
      children: [
        const ProfileHeader(),
        generalInfor == null
            ? const SizedBox(height: 20)
            : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.horizontalMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            generalInfor.catchPharse?[currentLanguageCode[0]] ??
                                '',
                            style: TextStyles.extraLargeBold,
                          ),
                        ),
                        CustomButton(
                          height: 24,
                          width: 24,
                          icon: SvgPicture.asset(
                            AppAssets.edit,
                            width: 24,
                          ),
                          bgColor: Colors.transparent,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          matchItem(generalInfor.generalInfors![index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: generalInfor.generalInfors?.length ?? 0,
                    ),
                    // Text(
                    //   generalInfor.generalInfors
                    //           ?.firstWhere(
                    //               (element) => element.inputType == 'heading')
                    //           .value?[currentLanguageCode[0]] ??
                    //       '',
                    //   style: TextStyles.mediumBold,
                    // ),
                    // const SizedBox(height: 20),
                    // Text(
                    //   generalInfor.generalInfors
                    //           ?.firstWhere(
                    //               (element) => element.inputType == 'description')
                    //           .value?[currentLanguageCode[0]] ??
                    //       '',
                    //   style: TextStyles.mediumRegular
                    //       .copyWith(height: 20 / 14, color: AppColors.brand2),
                    // ),
                    // // const SizedBox(height: 20),
                    // Column(
                    //   children: generalInfor.generalInfors
                    //           ?.where((element) => element.inputType == 'image')
                    //           .map((e) => Padding(
                    //                 padding: const EdgeInsets.only(top: 20),
                    //                 child: NetImage(
                    //                     width: double.maxFinite,
                    //                     height: 218,
                    //                     imageUrl: e.mediaUrl ?? ''),
                    //               ))
                    //           .toList() ??
                    //       [],
                    // ),
                    const SizedBox(height: 20),
                    ////////////////////// organizations & language skills
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => buildOrganization(
                            generalInfor.travelOrganization?[
                                    currentLanguageCode.first]![index] ??
                                ''),
                        itemCount: generalInfor
                                .travelOrganization?[currentLanguageCode.first]
                                ?.length ??
                            0),
                    // Column(
                    //     children: generalInfor
                    //             .travelOrganization?[currentLanguageCode[0]]
                    //             ?.map((org) => buildOrganization(org))
                    //             .toList() ??
                    //         []),
                    const SizedBox(height: 15),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 9),
                      itemCount: generalInfor.languageSkills?.length ?? 0,
                      itemBuilder: (context, index) => buildLanguageSkill(
                        name: generalInfor.languageSkills?[index].name ?? '',
                        level: generalInfor.languageSkills?[index].level ?? '',
                      ),
                    )
                  ],
                ),
              ),
        const PreviewFooter()
      ],
    );
  }

  Widget buildOrganization(String org) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: SvgPicture.asset(
              AppAssets.folder,
              width: 16,
            ),
          ),
          Text(org, style: TextStyles.mediumRegular),
        ],
      );

  Widget buildLanguageSkill({required String name, required String level}) =>
      Row(
        children: [
          Container(
            height: 24,
            width: 70,
            decoration: ShapeDecoration(
              color: AppColors.brand2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyles.smallBold
                    .copyWith(color: AppColors.white, height: 1),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            level,
            style: TextStyles.mediumRegular
                .copyWith(color: AppColors.brand2, height: 1),
          )
        ],
      );
}
