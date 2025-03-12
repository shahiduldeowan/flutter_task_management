import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";

part "home_tab_state.dart";

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(const HomeTabState(0));

  void onTabChanged(int index) {
    if (state.selectedIndex == index) return;
    emit(state.copyWith(selectedIndex: index));
  }
}
