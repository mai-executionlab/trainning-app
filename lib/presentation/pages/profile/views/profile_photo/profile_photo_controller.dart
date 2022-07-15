import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/repository_provider.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/pages/controller.dart';

enum PhotoType { byDate, byAlbum }

const photoType = PhotoType.values;

extension PhotoTypeExtension on PhotoType {
  String get label {
    switch (this) {
      case PhotoType.byDate:
        return '日付順';
      case PhotoType.byAlbum:
        return 'アルバム';
    }
  }
}

final photoTypeController = StateProvider<PhotoType>((ref) {
  return photoType[0];
});


class ProfilePhotoNotifier
    extends StateNotifier<PageStatus<List<Photo>>> {
  ProfilePhotoNotifier({
    required this.repositoryImpl,
  }) : super(PageStatus<List<Photo>>(PageState.init, data: []));

  final GuideRepositoryImpl repositoryImpl;

  final _page = 1;

  Future init({
    required String username,
  }) async {
    state = state.copyWith(PageState.loading);
    var result = await repositoryImpl.getUserAlbums(
        username: username,

        page: _page);

    state = PageStatus(PageState.loaded, data: result.list);
  }
}

final profilePhotoController = StateNotifierProvider.autoDispose<
    ProfilePhotoNotifier, PageStatus<List<Photo>>>(
  (ref) => ProfilePhotoNotifier(
    repositoryImpl: ref.watch(guideRepoProvider),
  ),
);
