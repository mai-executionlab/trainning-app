import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/data/data_source/mock.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/views/profile_photo/profile_photo_controller.dart';
import 'package:training_app/presentation/pages/profile/widgets/album_item.dart';
import 'package:training_app/presentation/pages/profile/widgets/skill_item.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.horizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '写真',
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
          const SizedBox(height: 20),
          SizedBox(
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildSelectType(type: PhotoType.byDate),
                  const SizedBox(width: 10),
                  buildSelectType(type: PhotoType.byAlbum)
                ],
              )),
          const SizedBox(height: 25),
          Consumer(
            builder: (context, ref, child) {
              debugPrint(
                  photoType.indexOf(ref.watch(photoTypeController)).toString());
              return IndexedStack(
                index: photoType.indexOf(ref.watch(photoTypeController)),
                children: photoType
                    .map((type) => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => AlbumItem(
                              title: ref.watch(photoTypeController) ==
                                      PhotoType.byAlbum
                                  ? listContentPhoto[index]
                                  : listActivity[index]['time'] ?? '',
                              listImg: listImgPhoto[index],
                              type: type,
                            ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 40),
                        itemCount: listSkill.length))
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildSelectType({required PhotoType type}) {
    return Builder(
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            return Container(
              padding: const EdgeInsets.only(left: 24, right: 13),
              decoration: ShapeDecoration(
                color: ref.watch(photoTypeController) == type
                    ? AppColors.black
                    : AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                        color: ref.watch(photoTypeController) == type
                            ? AppColors.black
                            : AppColors.greyBorder)),
              ),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: ref.watch(photoTypeController) == type
                    ? null
                    : () {
                        ref.read(photoTypeController.state).state = type;
                        debugPrint(photoType
                            .indexOf(ref.read(photoTypeController))
                            .toString());
                      },
                child: Row(
                  children: [
                    Text(
                      type.label,
                      style: ref.watch(photoTypeController) == type
                          ? TextStyles.mediumBold
                              .copyWith(color: AppColors.white)
                          : TextStyles.mediumRegular
                              .copyWith(color: AppColors.black),
                    ),
                    const SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.5),
                      child: SvgPicture.asset(
                        AppAssets.downArrow,
                        width: 12,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
    // return ChoiceChip(
    //   labelStyle: TextStyles.mediumRegular,
    //   selectedColor: AppColors.black,
    //   label: Text(label),
    //   labelPadding: EdgeInsets.zero,
    //   onSelected: (isSelected) {},
    //   selected: true,
    // );
  }
}
