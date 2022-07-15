import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/pages/controller.dart';

class ProfileSkillNotifier extends StateNotifier<PageStatus<Skill>> {
  ProfileSkillNotifier({
    required this.repositoryImpl,
  }) : super(PageStatus<Skill>(PageState.init, data: Skill()));

  final GuideRepositoryImpl repositoryImpl;

  Future init({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) async {
    state = state.copyWith(PageState.loading);
    var result = await repositoryImpl.getUserSkills(
      username: username,
      primaryLanguage: primaryLanguage,
      secondLanguage: secondLanguage,
    );
    state = PageStatus(PageState.loaded, data: result.object);
  }
}

final profileSkillController =
    StateNotifierProvider.autoDispose<ProfileSkillNotifier, PageStatus<Skill>>(
  (ref) => ProfileSkillNotifier(
    repositoryImpl: ref.watch(guideRepoProvider),
  ),
);
