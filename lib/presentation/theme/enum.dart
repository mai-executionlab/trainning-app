import 'package:training_app/presentation/theme/assets.dart';

enum ProfileTab { home, spot, skill, activity, photo }

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
