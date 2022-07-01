import 'package:riverpod/riverpod.dart';

final tabController = StateProvider<int>((ref) => 0);

final toggleLanguageController = StateProvider((ref) => [false, true]);
