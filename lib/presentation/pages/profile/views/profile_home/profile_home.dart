import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/domain/entities/entity.dart';

import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/pages/profile/views/profile_home/profile_home_controller.dart';
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

    final currentLanguageCode = ref.watch(languageController.call(Account()));

    return generalInfor == null
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
                        generalInfor.catchPharse?[currentLanguageCode[0]] ?? '',
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
                Text(
                  generalInfor.generalInfors
                          ?.firstWhere(
                              (element) => element.inputType == 'heading')
                          .value?[currentLanguageCode[0]] ??
                      '',
                  style: TextStyles.mediumBold,
                ),
                const SizedBox(height: 20),
                Text(
                  generalInfor.generalInfors
                          ?.firstWhere(
                              (element) => element.inputType == 'description')
                          .value?[currentLanguageCode[0]] ??
                      '',
                  style: TextStyles.mediumRegular
                      .copyWith(height: 20 / 14, color: AppColors.brand2),
                ),
                // const SizedBox(height: 20),
                Column(
                  children: generalInfor.generalInfors
                          ?.where((element) => element.inputType == 'image')
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: NetImage(
                                    width: double.maxFinite,
                                    height: 218,
                                    imageUrl: e.mediaUrl ?? ''),
                              ))
                          .toList() ??
                      [],
                ),
                const SizedBox(height: 20),
                ////////////////////// organizations & language skills
                Column(
                    children: generalInfor
                            .travelOrganization?[currentLanguageCode[0]]
                            ?.map((org) => buildOrganization(org))
                            .toList() ??
                        []),
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
