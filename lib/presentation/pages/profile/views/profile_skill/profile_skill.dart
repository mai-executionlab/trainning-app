import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/pages/profile/views/profile_skill/profile_skill_controlller.dart';
import 'package:training_app/presentation/pages/profile/widgets/profile_header.dart';
import 'package:training_app/presentation/pages/profile/widgets/skill_item.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileSkill extends ConsumerWidget {
  const ProfileSkill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var data = ref.watch(profileSkillController).data;
    var currentLanguage = ref.watch(languageController);
    Map<String, String> degree = {
      "beginner": "初心者",
      "elementary": "小学校",
      "advanced": "高度",
      "imediately": "中級",
      "expert": "エキスパート",
    };
    return ListView(
      children: [
        const ProfileHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.horizontalMargin),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'スキル',
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
              const SizedBox(height: 25),
              if (data?.domesticBManager == true)
                const SkillItem(
                  title: '旅行業務取扱管理者（国内)',
                ),
              if (data?.generalBManager == true)
                const SkillItem(
                  title: '旅行業務取扱管理者（総合)',
                ),
              if (data?.toeic != null)
                SkillItem(
                  title: 'TOEIC',
                  level: '${data?.toeic} 点',
                ),
              if (data?.tourismEnglish == true)
                const SkillItem(
                  title: '観光英語検定',
                ),
              if (data?.travelGeography != null)
                SkillItem(
                  title: '旅行地理検定',
                  level: degree[data?.travelGeography],
                ),
              if (data?.worldHeritage == true)
                const SkillItem(
                  title: '世界遺産検定',
                ),
              if (data?.otherDegrees?[currentLanguage[0]] != null &&
                  data!.otherDegrees![currentLanguage[0]]!.isNotEmpty)
                const SkillItem(
                  title: 'その他の資格',
                ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildOtherDegrees(
                    data?.otherDegrees?[currentLanguage[0]]?[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: data?.otherDegrees?[currentLanguage[0]]?.length ?? 0,
              ),

              // ListView.separated(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) => SkillItem(
              //           title: listSkill[index]['title'],
              //           level: listSkill[index]['level'],
              //         ),
              //     separatorBuilder: (context, index) =>
              //         const SizedBox(height: 10),
              //     itemCount: listSkill.length)
            ],
          ),
        ),
        const PreviewFooter(),
      ],
    );
  }

  buildOtherDegrees(String? title) => Container(
      height: 58,
      padding: const EdgeInsets.only(left: 16, right: 26),
      margin: const EdgeInsets.only(bottom: 10, left: 40),
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shadows: [
          BoxShadow(
            blurRadius: 2,
            color: AppColors.black.withOpacity(0.2),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      child: Text(
        title ?? '',
        style:
            TextStyles.largeBold.copyWith(color: AppColors.black, height: 1.1),
      ));
}
