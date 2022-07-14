import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';

class ProfileHomeNotifier extends StateNotifier<GeneralInformation?> {
  final GuideRepositoryImpl repositoryImpl;
  ProfileHomeNotifier({
    required this.repositoryImpl,
  }) : super(null);

  init({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) async {
    var result = await repositoryImpl.getUserGeneralInfor(
      username: username,
      primaryLanguage: primaryLanguage,
      secondLanguage: secondLanguage,
    );

    state = result.object;
  }
}

final profileHomeController =
    StateNotifierProvider.autoDispose<ProfileHomeNotifier, GeneralInformation?>((ref) =>
        ProfileHomeNotifier(repositoryImpl: ref.watch(guideRepoProvider)));


