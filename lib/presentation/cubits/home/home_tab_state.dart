part of "home_tab_cubit.dart";

class HomeTabState extends Equatable {
  const HomeTabState(this.selectedIndex);

  final int selectedIndex;

  HomeTabState copyWith({
    int? selectedIndex,
  }) {
    return HomeTabState(
      selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [selectedIndex];
}
