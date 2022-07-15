import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/controller.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/pages/profile/views/index.dart';
import 'package:training_app/presentation/pages/profile/views/profile_activity/profile_activity_controlller.dart';
import 'package:training_app/presentation/pages/profile/views/profile_photo/profile_photo_controller.dart';
import 'package:training_app/presentation/pages/profile/views/profile_spot/profile_spot_controller.dart';
import 'package:training_app/presentation/pages/profile/widgets/profile_header.dart';

import 'package:training_app/presentation/theme/theme.dart';

import 'views/profile_home/profile_home_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(profileHeaderController.notifier).init();
    ref.listen<PageStatus>(
      profileHeaderController,
      (previous, next) {
        if (next.state == PageState.loaded) {
          // print('listen header');
          var username = next.data.username ?? '';
          var language1 = next.data.primaryLanguage?.code ?? 'ja';
          var language2 = next.data.secondaryLanguage?.code ?? 'en';
          ref.watch(profileHomeController.notifier).init(
              username: username,
              primaryLanguage: language1,
              secondLanguage: language2);

          Future.wait([
            ref.watch(profileDestinationController.notifier).init(
                username: username,
                primaryLanguage: language1,
                secondLanguage: language2),
            ref.watch(profileActivityController.notifier).init(
                username: username,
                primaryLanguage: language1,
                secondLanguage: language2),
            ref.watch(profilePhotoController.notifier).init(
                  username: username,
                ),
          ]);
          GuideService guideService =
              GuideService(dioClient: ref.watch(dioProvider));
          // // guideService.getUserSkills(
          // //     username: 'hang', primaryLanguage: 'ja', secondLanguage: 'en');
          guideService.getUserAlbums(username: 'hang', page: 1);
          // // guideService.getUserDestinations(
          // //     username: 'hang',
          // //     primaryLanguage: 'ja',
          // //     secondLanguage: 'en',
          // //     page: 1);
          // guideService.getUserActivities(
          //     username: 'hang',
          //     primaryLanguage: 'ja',
          //     secondLanguage: 'en',
          //     page: 1);
          if (next.state == PageState.loading) {
            print('check $previous');
          }
        }
      },
    );
    final Account? account = ref.watch(profileHeaderController).data;

    final currentLanguageCode = ref.watch(languageController);

    const tabbar = ProfileTab.values;

    // print(account?.nickname);

    const header = ProfileHeader(
        // account: account ?? Account(),
        // currentLanguage: currentLanguageCode,
        );

    Widget mapTabView(ProfileTab tab) {
      switch (tab) {
        case ProfileTab.home:
          return const ProfileHome();
        case ProfileTab.spot:
          return const ProfileSpot();
        case ProfileTab.skill:
          return const ProfileSkill();
        case ProfileTab.activity:
          return const ProfileActivity();
        case ProfileTab.photo:
          return const ProfilePhoto();
      }
    }

    final footer = PreviewFooter(
      themeColor: account?.getThemeColor,
    );
    return DefaultTabController(
      length: tabbar.length,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Consumer(builder: (context, ref, child) {
            // can be switch only main section but not save offset of list
            return IndexedStack(
              index: ref.watch(tabController),
              children: tabbar.map((tab) => mapTabView(tab)).toList(),
            );
          }),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
          padding: const EdgeInsets.only(top: 5),
          height: 75,
          width: double.maxFinite,
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(blurRadius: 5, color: AppColors.black.withOpacity(0.25))
            ],
            color: AppColors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Center(
            child: Consumer(
              builder: (context, ref, _) {
                return TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelStyle: TextStyles.smallBold,
                  labelColor: AppColors.customizeFG,
                  unselectedLabelColor: AppColors.customizeFG.withOpacity(0.5),
                  tabs: tabbar
                      .map((tab) => Tab(
                            text: tab.tabName,
                            iconMargin: const EdgeInsets.only(bottom: 5),
                            // icon: Icon(Icons.abc),
                            icon: SvgPicture.asset(
                              tab.tabIcon,
                              height: 24,
                              color: tabbar[ref.watch(tabController)] == tab
                                  ? AppColors.customizeFG
                                  : AppColors.customizeFG.withOpacity(0.5),
                            ),
                          ))
                      .toList(),
                  onTap: (index) {
                    ref.read(tabController.state).state = index;
                  },
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
