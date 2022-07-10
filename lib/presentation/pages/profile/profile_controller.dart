import 'package:riverpod/riverpod.dart';

import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/pages/controller.dart';
import 'package:training_app/presentation/theme/theme.dart';

final tabController = StateProvider<int>((ref) => 0);

final languageController = Provider.family<List<String>, Account?>((ref, args) {
  // final account = ref.watch(profileHeaderController);
  final currentLanguage = ref.watch(toggleLanguageController);
  List<String> languages = [
    args?.primaryLanguage?.code ?? 'ja',
    args?.secondaryLanguage?.code ?? 'en'
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

// final accountController = FutureProvider((ref) async {
//   print('future account');
//   return await ref.watch(guideRepoProvider).getUserDetailInfor();
// });

final tabHomeController =
    FutureProvider.family<ObjectResponse<GeneralInformation>, List<String?>>(
  (ref, args) async {
    return await ref.watch(guideRepoProvider).getUserGeneralInfor(
          username: args[0] ?? '',
          primaryLanguage: args[1] ?? 'ja',
          secondLanguage: args[2] ?? 'en',
        );
  },
);

enum PageState {
  init,
  loading,
  loaded,
  error,
}

class ProfileHeaderNotifier extends StateNotifier<Account?> {
  final GuideRepositoryImpl repositoryImpl;
  ProfileHeaderNotifier({
    required this.repositoryImpl,
  }) : super(null);

  init() async {
    var result = await repositoryImpl.getUserDetailInfor();

    state = result.object;
  }
}

final profileHeaderController =
    StateNotifierProvider<ProfileHeaderNotifier, Account?>((ref) =>
        ProfileHeaderNotifier(repositoryImpl: ref.watch(guideRepoProvider)));
