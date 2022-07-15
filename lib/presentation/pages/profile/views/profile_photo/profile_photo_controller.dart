import 'package:collection/collection.dart';
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

final photoTypeController = StateProvider<PhotoType?>((ref) {
  return null;
});

// class ProfilePhotoNotifier extends StateNotifier<PageStatus<List<MapEntry<int?,List<Photo?>>>>> {
//   ProfilePhotoNotifier({
//     required this.repositoryImpl,
//   }) : super(PageStatus<List<MapEntry<int?, List<Photo?>>>>(PageState.init, data: []));

//   final GuideRepositoryImpl repositoryImpl;

//   final _page = 1;

//   Future init({
//     required String username,
//   }) async {
//     state = state.copyWith(PageState.loading);
//     var result =
//         await repositoryImpl.getUserAlbums(username: username, page: _page);
//     List<MapEntry<int?, List<Photo?>>> list =
//         groupBy<Photo?, int?>(result.list, (e) => e?.id).entries.toList();
//     // print(list[0].value.length);
//     // list.entries.
//     state = PageStatus(PageState.loaded, data: list);
//   }
// }

class ProfilePhotoNotifier extends StateNotifier<PageStatus<List<Photo?>>> {
  ProfilePhotoNotifier({
    required this.repositoryImpl,
  }) : super(PageStatus<List<Photo?>>(PageState.init, data: []));

  final GuideRepositoryImpl repositoryImpl;

  final _page = 1;

  Future init({
    required String username,
  }) async {
    state = state.copyWith(PageState.loading);
    var result =
        await repositoryImpl.getUserAlbums(username: username, page: _page);
    // List<MapEntry<int?, List<Photo?>>> list =
    //     groupBy<Photo?, int?>(result.list, (e) => e?.id).entries.toList();
    // print(list[0].value.length);
    // list.entries.
    state = PageStatus(PageState.loaded, data: result.list);
  }

  List<MapEntry<int?, List<Photo?>>> sortByAlbums() =>
      groupBy<Photo?, int?>(state.data ?? [], (e) => e?.id).entries.toList();

  List<MapEntry<String?, List<Photo?>>> sortByTime() =>
      groupBy<Photo?, String?>(state.data ?? [], (e) => e?.timeline)
          .entries
          .toList();
}

final profilePhotoController = StateNotifierProvider.autoDispose<
    ProfilePhotoNotifier, PageStatus<List<Photo?>>>(
  (ref) => ProfilePhotoNotifier(
    repositoryImpl: ref.watch(guideRepoProvider),
  ),
);
