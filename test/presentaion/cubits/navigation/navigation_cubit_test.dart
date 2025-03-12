import "package:bloc_test/bloc_test.dart";
import "package:flutter_test/flutter_test.dart";
import "package:task/presentation/cubits/navigation/navigation_cubit.dart";

void main() {
  group("NavigationCubit", () {
    late NavigationCubit navigationCubit;

    setUp(() {
      navigationCubit = NavigationCubit();
    });

    tearDown(() {
      navigationCubit.close();
    });

    test("initial state should be NavigationState with index 0", () {
      expect(navigationCubit.state, equals(const NavigationState(0)));
    });

    blocTest<NavigationCubit, NavigationState>(
      "emits [NavigationState(1)] when onTabChanged is called with 1",
      build: () => NavigationCubit(),
      act: (cubit) => cubit.onTabChanged(1),
      expect: () => [const NavigationState(1)],
    );

    blocTest<NavigationCubit, NavigationState>(
      "does not emit a new state when the same tab index is selected",
      build: () => NavigationCubit(),
      act: (cubit) {
        cubit.onTabChanged(0); // No change, should not emit new state
      },
      expect: () => [],
    );

    blocTest<NavigationCubit, NavigationState>(
      "emits [NavigationState(2)] when onTabChanged is called with 2",
      build: () => NavigationCubit(),
      act: (cubit) => cubit.onTabChanged(2),
      expect: () => [const NavigationState(2)],
    );
  });
}
