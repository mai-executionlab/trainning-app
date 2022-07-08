import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ToggleButtonNotifier extends StateNotifier<List<bool>> {
  ToggleButtonNotifier(List<bool> current) : super(current);

  onToggle({required int index}) {
    var currentState = state;
    if (!currentState[index]) {
      if (state.length == 2) {
        state = currentState.reversed.toList();
      } else {
        // handle in case toggle has more than 2 buttons
        // state = List.filled(currentState.length, false);
        // state[index] = true;
      }
    }
  }
}

final textFieldController = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();

  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});
