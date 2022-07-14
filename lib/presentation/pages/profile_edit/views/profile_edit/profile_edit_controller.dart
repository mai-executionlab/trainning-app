import 'package:riverpod/riverpod.dart';
import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/pages/controller.dart';

final privacyController = StateNotifierProvider.family
    .autoDispose<ToggleButtonNotifier, List<bool>, bool>(
  (ref, arg) => arg == false
      ? ToggleButtonNotifier([true, false])
      : ToggleButtonNotifier([false, true]),
);

final languagesProvider = FutureProvider(
    (ref) async => await ref.watch(languageRepoProvider).getLanguages());

final nicknameToggleLanguage =
    StateNotifierProvider.autoDispose<ToggleButtonNotifier, List<bool>>(
        (ref) => ToggleButtonNotifier([true, false]));

final catchyToggleLanguage =
    StateNotifierProvider.autoDispose<ToggleButtonNotifier, List<bool>>(
        (ref) => ToggleButtonNotifier([true, false]));

final primaryLanguageProvider =
    StateProvider.autoDispose<Language?>((ref) => null);
final secondaryLanguageProvider =
    StateProvider.autoDispose<Language?>((ref) => null);

// final chooseLanguage =
//     StateProvider.autoDispose<List<Language?>>((ref) => [null, null]);

class ProfileEditNotifier extends StateNotifier<PageStatus> {
  final GuideRepositoryImpl repositoryImpl;
  ProfileEditNotifier({
    required this.repositoryImpl,
  }) : super(PageStatus<Account>(PageState.init));

  Future fetchData() async {
    state = PageStatus(PageState.loading);
    var result = await repositoryImpl.getUserDetailInfor();

    Account account = result.object;

    state = PageStatus(PageState.loaded, data: account);
  }

  // fetchData({required String username}) async {
  //   var result2 = await repositoryImpl.getUserShortInfor(username: username);
  //   state.data.account.avatarUrl = result2.object.avatarUrl;
  //   state.data.coverImageUrl = result2.object.coverImageUrl;
  // }
}

final profileEditController =
    StateNotifierProvider<ProfileEditNotifier, PageStatus>((ref) =>
        ProfileEditNotifier(repositoryImpl: ref.watch(guideRepoProvider)));
