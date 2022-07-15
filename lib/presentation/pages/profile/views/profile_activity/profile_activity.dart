import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/views/profile_activity/profile_activity_controlller.dart';
import 'package:training_app/presentation/pages/profile/widgets/activity_item.dart';
import 'package:training_app/presentation/pages/profile/widgets/profile_header.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileActivity extends ConsumerWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var profileActivity = ref.watch(profileActivityController);
    List<Activity>? list = profileActivity.data;
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileHeader(),
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
                  time: list?[index].departureDate,
                  title: list?[index].title,
                  content: list?[index].description,
                  listImg:
                      list?[index].media?.map((e) => e.url!).toList() ?? [],
                ),
            separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 32, horizontal: AppStyles.horizontalMargin),
                  height: 32,
                  child: CustomPaint(
                    painter: ShapeSeparatorPainter(),
                  ),
                ),
            itemCount: list?.length ?? 0),
        const PreviewFooter(),
      ],
    );
  }
}
