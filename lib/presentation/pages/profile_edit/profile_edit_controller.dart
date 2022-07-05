import 'package:riverpod/riverpod.dart';
import 'package:training_app/presentation/pages/controller.dart';

// final toggleLanguageEditController = StateProvider((ref) => [true, false]);
final toggleLanguageEditController =
    StateNotifierProvider<ToggleButtonNotifier, List<bool>>(
        (ref) => ToggleButtonNotifier([true, false]));

// final
