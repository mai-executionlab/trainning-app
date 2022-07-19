import 'package:riverpod/riverpod.dart';

import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/pages/controller.dart';
import 'package:training_app/presentation/theme/theme.dart';

final tabController = StateProvider<int>((ref) => 0);

final languageController = Provider.autoDispose<List<String>>((ref) {
  final account = ref.watch(profileHeaderController).data;
  final currentLanguage = ref.watch(toggleLanguageController);
  List<String> languages = [
    account?.primaryLanguage?.code ?? 'ja',
    account?.secondaryLanguage?.code ?? 'en'
  ];
  if (currentLanguage[0] == false) {
    return languages.reversed.toList();
  } else {
    return languages;
  }
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


class ProfileHeaderNotifier extends StateNotifier<PageStatus<Account>> {
  final GuideRepositoryImpl repositoryImpl;
  ProfileHeaderNotifier({
    required this.repositoryImpl,
  }) : super(PageStatus<Account>(PageState.init));

  Future init() async {
    state = PageStatus(PageState.loading);
    var result = await repositoryImpl.getUserDetailInfor();// get username only
    // Account account = result.object;

    var result2 = await repositoryImpl.getUserShortInfor(
        username: result.object.username!);
    Account account = result2.object;
    // account.avatarUrl = result2.object.avatarUrl;
    // account.coverImageUrl = result2.object.coverImageUrl;

    state = PageStatus(PageState.loaded, data: account);
  }
}

final profileHeaderController =
    StateNotifierProvider.autoDispose<ProfileHeaderNotifier, PageStatus<Account>>((ref) =>
        ProfileHeaderNotifier(repositoryImpl: ref.watch(guideRepoProvider)));
