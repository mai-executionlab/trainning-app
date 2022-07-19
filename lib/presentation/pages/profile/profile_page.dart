import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/injection.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/controller.dart';
import 'package:training_app/presentation/pages/login/login_page.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/presentation/pages/profile/views/index.dart';

import 'package:training_app/presentation/theme/theme.dart';
import 'package:training_app/shared_pref.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<PageStatus>(
      profileHeaderController,
      (previous, next) async {
        if (next.state == PageState.loaded) {
          // print('listen header');
          var username = next.data.username ?? '';
          var language1 = next.data.primaryLanguage?.code ?? 'ja';
          var language2 = next.data.secondaryLanguage?.code ?? 'en';
          ref.read(profileHomeController.notifier).init(
              username: username,
              primaryLanguage: language1,
              secondLanguage: language2);

          await Future.wait([
            ref.read(profileDestinationController.notifier).init(
                username: username,
                primaryLanguage: language1,
                secondLanguage: language2),
            ref.read(profileActivityController.notifier).init(
                username: username,
                primaryLanguage: language1,
                secondLanguage: language2),
            ref.read(dateMediaController.notifier).init(username: username),
            ref.read(albumMediaController.notifier).init(username: username),
            ref.read(profileSkillController.notifier).init(
                username: username,
                primaryLanguage: language1,
                secondLanguage: language2),
          ]);
          ref.read(photoTypeController.state).state = MediaType.byDate;
        }
      },
    );
    final Account? account = ref.watch(profileHeaderController).data;
    const tabbar = ProfileTab.values;

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
          return const ProfileMedia();
      }
    }

    String tabTitle(ProfileTab tab) {
      switch (tab) {
        case ProfileTab.home:
          return AppLocalizations.of(context)!.home;
        case ProfileTab.spot:
          return AppLocalizations.of(context)!.spot;
        case ProfileTab.skill:
          return AppLocalizations.of(context)!.skill;
        case ProfileTab.activity:
          return AppLocalizations.of(context)!.activity;
        case ProfileTab.photo:
          return AppLocalizations.of(context)!.photo;
      }
    }

    final GlobalKey<ScaffoldState> globalKey = GlobalKey();
    return DefaultTabController(
      length: tabbar.length,
      child: Scaffold(
        key: globalKey,
        endDrawer: Drawer(
            child: ListView(
          padding: const EdgeInsets.all(AppStyles.horizontalMargin),
          children: [
            CupertinoButton(
              onPressed: () async {
                showDialog(
                    context: context, builder: (_) => const LoadingDialog());
                ref.read(authRepoProvider).logout().then((value) {
                  if (value.object == true) {
                    getIt<SharedPref>().clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                        (route) => false);
                    ref.read(tabController.state).state = 0;
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ログアウト',
                    style:
                        TextStyles.largeBold.copyWith(color: AppColors.black),
                  ),
                  Transform.rotate(
                      angle: pi,
                      child: SvgPicture.asset(
                        AppAssets.leftArrow,
                        color: AppColors.secondaryColor,
                      ))
                ],
              ),
            ),
          ],
        )),
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Consumer(builder: (context, ref, child) {
            // can be switch only main section but not save offset of list
            return Column(
              children: [
                Container(
                  height: 64,
                  color: account?.getThemeColor == null
                      ? AppColors.lightBlue
                      : Color(account!.getThemeColor!),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppStyles.horizontalMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SvgPicture.asset(AppAssets.markColor),
                      SizedBox(
                        height: 34,
                        child: Image.asset(AppAssets.mark),
                      ),
                      InkWell(
                        onTap: () => globalKey.currentState?.openEndDrawer(),
                        child: SizedBox(
                          height: 18,
                          child: SvgPicture.asset(AppAssets.menu),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: IndexedStack(
                    index: ref.watch(tabController),
                    children: tabbar.map((tab) => mapTabView(tab)).toList(),
                  ),
                ),
              ],
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
                            text: tabTitle(tab),
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
