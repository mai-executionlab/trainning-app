import 'package:flutter/cupertino.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/theme/colors.dart';
import 'package:training_app/presentation/theme/style.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    Key? key,
    this.time,
    this.title,
    this.content,
    this.listImg,
  }) : super(key: key);
  final String? time;
  final String? title;
  final String? content;
  final List<String>? listImg;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.horizontalMargin),
          child: Text(
            time ?? '',
            style: TextStyles.mediumRegular.copyWith(
              color: AppColors.brand2,
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.horizontalMargin),
            child: Text(
              title ?? '',
              style: TextStyles.extraLargeBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
        if (listImg != null && listImg!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: buildImageSection(listImg!),
          ),
        if (content != null)
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.horizontalMargin),
            child: Text(
              content ?? '',
              style: TextStyles.mediumRegular
                  .copyWith(color: AppColors.black, height: 25 / 14),
            ),
          )
      ],
    );
  }

  Widget buildImageSection(List<String> list) {
    return list.length == 1
        ? Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.horizontalMargin),
            child: NetImage(
              width: double.maxFinite,
              height: 230,
              imageUrl: list[0],
              radius: 5,
            ),
          )
        : SizedBox(
            height: 194,
            child: GridView.builder(
                physics: const BouncingScrollPhysics(), //https://www.flutterforum.org/d/1296-notification-metrics-axis-widget-axis-is-not-true
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.horizontalMargin),
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 14,
                  childAspectRatio: 194 / 275,
                ),
                itemBuilder: (context, index) =>
                    NetImage(width: 275, height: 194, imageUrl: list[index])),
          );
  }
}
