import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/presentation/pages/controller.dart';
import 'package:training_app/presentation/theme/theme.dart';

final tabController = StateProvider<int>((ref) => 0);

final languageController = Provider<String>((ref) {
  final account = ref.watch(accountController).value?.object;
  final currentLanguage = ref.watch(toggleLanguageController);
  if (currentLanguage[0] == false) {
    return account?.secondaryLanguage!.code??'en';
  }
  return account?.primaryLanguage!.code??'ja';
});
final toggleLanguageController =
    StateNotifierProvider<ToggleButtonNotifier, List<bool>>(
  (ref) {
    return ToggleButtonNotifier([true, false]);
  },
);

enum ProfileTab {
  home,
  spot,
  skill,
  activity,
  photo,
}

extension ProfileTabExtension on ProfileTab {
  String get tabName {
    switch (this) {
      case ProfileTab.home:
        return 'ホーム';
      case ProfileTab.spot:
        return '観光地';
      case ProfileTab.skill:
        return 'スキル';
      case ProfileTab.activity:
        return '活動';
      case ProfileTab.photo:
        return '写真';
    }
  }

  String get tabIcon {
    switch (this) {
      case ProfileTab.home:
        return AppAssets.home;
      case ProfileTab.spot:
        return AppAssets.spot;
      case ProfileTab.skill:
        return AppAssets.skill;
      case ProfileTab.activity:
        return AppAssets.activity;
      case ProfileTab.photo:
        return AppAssets.image;
    }
  }
}

final accountController = FutureProvider((ref) {
  debugPrint('call');
  return ref.watch(guideRepoProvider).getUserDetailInfor();
});
