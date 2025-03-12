part of "navigation_cubit.dart";

class NavigationState extends Equatable {
  const NavigationState(this.selectedIndex);
  final int selectedIndex;

  NavigationState copyWith({int? selectedIndex}) {
    return NavigationState(selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object> get props => [selectedIndex];
}
