import 'package:riverpod/riverpod.dart';
import 'package:training_app/presentation/pages/controller.dart';

final privacyController =
    StateNotifierProvider<ToggleButtonNotifier, List<bool>>(
        (ref) => ToggleButtonNotifier([true, false]));
