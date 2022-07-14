import 'package:riverpod/riverpod.dart';
import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/destination.dart';
import 'package:training_app/presentation/pages/controller.dart';

class ProfileDestinationNotifier
    extends StateNotifier<PageStatus<List<Destinations>>> {
  ProfileDestinationNotifier({
    required this.repositoryImpl,
  }) : super(PageStatus<List<Destinations>>(PageState.init, data: []));

  final GuideRepositoryImpl repositoryImpl;

  final _page = 1;

  Future init({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) async {
    state = state.copyWith(PageState.loading);
    var result = await repositoryImpl.getUserDestinations(
        username: username,
        primaryLanguage: primaryLanguage,
        secondLanguage: secondLanguage,
        page: _page);

    state = PageStatus(PageState.loaded, data: result.list);
  }
}

final profileDestinationController = StateNotifierProvider.autoDispose<
    ProfileDestinationNotifier, PageStatus<List<Destinations>>>(
  (ref) => ProfileDestinationNotifier(
    repositoryImpl: ref.watch(guideRepoProvider),
  ),
);
