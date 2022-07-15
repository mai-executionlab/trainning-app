import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleBtn<T> {
  ToggleBtn({
    required this.isSelected,
    required this.data,
  });
  List<bool> isSelected;
  List<T> data;
}

// class ToggleButtonNotifier<T> extends StateNotifier<ToggleBtn<T>> {
//   ToggleButtonNotifier(ToggleBtn<T> current) : super(current);

//   onToggle({required int index}) {
//     var currentState = state;
//     if (!currentState.isSelected[index]) {
//       if (state.isSelected.length == 2) {
//         state = currentState..isSelected.reversed.toList();
//       } else {
//         // handle in case toggle has more than 2 buttons
//         // state = List.filled(currentState.length, false);
//         // state[index] = true;
//       }
//     }
//   }
// }

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

enum PageState {
  init,
  loading,
  loaded,
  error,
}

class PageStatus<T> {
  PageStatus(this.state, {this.data});
  PageState state;
  T? data;

  PageStatus<T> copyWith(PageState state) => PageStatus(state, data: data);
}
