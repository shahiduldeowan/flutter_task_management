import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";

part "navigation_state.dart";

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(0));

  /// Called when the user changes the selected tab.
  ///
  /// Does nothing if the selected tab index is already [selectedIndex].
  void onTabChanged(int selectedIndex) {
    if (selectedIndex == state.selectedIndex) return;
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
}
