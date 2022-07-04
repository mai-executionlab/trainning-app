import 'package:flutter_riverpod/flutter_riverpod.dart';

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
