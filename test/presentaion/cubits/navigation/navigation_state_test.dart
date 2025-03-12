import "package:flutter_test/flutter_test.dart";
import "package:task/presentation/cubits/navigation/navigation_cubit.dart";

void main() {
  group("NavigationState", () {
    test("constructor sets selectedIndex", () {
      final state = const NavigationState(1);
      expect(state.selectedIndex, 1);
    });

    test("copyWith updates selectedIndex", () {
      final state = const NavigationState(1);
      final newState = state.copyWith(selectedIndex: 2);
      expect(newState.selectedIndex, 2);
    });

    test("copyWith retains original selectedIndex if not provided", () {
      final state = const NavigationState(1);
      final newState = state.copyWith();
      expect(newState.selectedIndex, 1);
    });

    test("props returns selectedIndex", () {
      final state = const NavigationState(1);
      expect(state.props, [1]);
    });

    test("equality works based on selectedIndex", () {
      final state1 = const NavigationState(1);
      final state2 = const NavigationState(1);
      final state3 = const NavigationState(2);

      expect(state1, state2);
      expect(state1, isNot(state3));
    });
  });
}
