import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/domain/entities/destination.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/pages/profile/views/profile_spot/profile_spot_controller.dart';
import 'package:training_app/presentation/pages/profile/widgets/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileSpot extends ConsumerWidget {
  const ProfileSpot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var profileDestination = ref.watch(profileDestinationController);
    List<Destinations>? list = profileDestination.data;
    final currentLanguageCode = ref.watch(languageController);

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
                      // '案内できる観光地',
                      AppLocalizations.of(context)!.spotTitle,
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
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SpotItem(
                  img: list?[index].imgUrl,
                  location: list?[index].area?.name?[currentLanguageCode[0]] ??
                      list?[index].area?.name?['en'],
                  title: list?[index].name?[currentLanguageCode[0]],
                  content: list?[index].description?[currentLanguageCode[0]],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 32),
                itemCount: list?.length ?? 0,
              )
            ],
          ),
        ),
        const PreviewFooter(),
      ],
    );
  }
}
