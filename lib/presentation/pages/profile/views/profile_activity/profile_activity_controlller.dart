import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/pages/controller.dart';

class ProfileActivityNotifier
    extends StateNotifier<PageStatus<List<Activity>>> {
  ProfileActivityNotifier({
    required this.repositoryImpl,
  }) : super(PageStatus<List<Activity>>(PageState.init, data: []));

  final GuideRepositoryImpl repositoryImpl;

  final _page = 1;

  Future init({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) async {
    state = state.copyWith(PageState.loading);
    var result = await repositoryImpl.getUserActivities(
        username: username,
        primaryLanguage: primaryLanguage,
        secondLanguage: secondLanguage,
        page: _page);

    state = PageStatus(PageState.loaded, data: result.list);
  }
}

final profileActivityController = StateNotifierProvider.autoDispose<
    ProfileActivityNotifier, PageStatus<List<Activity>>>(
  (ref) => ProfileActivityNotifier(
    repositoryImpl: ref.watch(guideRepoProvider),
  ),
);
