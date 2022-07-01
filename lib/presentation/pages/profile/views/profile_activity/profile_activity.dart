import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/data/data_source/mock.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/widgets/activity_item.dart';
import 'package:training_app/presentation/pages/profile/widgets/skill_item.dart';
import 'package:training_app/presentation/theme/style.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileActivity extends StatelessWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.horizontalMargin),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '最近の活動',
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
        ),
        const SizedBox(height: 25),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ActivityItem(
                  time: listActivity[index]['time'],
                  title: listActivity[index]['title'],
                  content: listActivity[index]['content'],
                  listImg: listImgActivity[index]['list_img'],
                ),
            separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 32, horizontal: AppStyles.horizontalMargin),
                  height: 32,
                  child: CustomPaint(
                    painter: ShapeSeparatorPainter(),
                  ),
                ),
            itemCount: listActivity.length)
      ],
    );
  }
}
