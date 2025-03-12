import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/presentation/all_task/all_task_page.dart";
import "package:task/presentation/create_new_task/create_new_task_page.dart";
import "package:task/presentation/cubits/navigation/navigation_cubit.dart";
import "package:task/presentation/pages/home_page.dart";
import "package:task/presentation/widgets/main/bottom_nav_bar.dart";

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static final PageStorageBucket _pageStorageBucket = PageStorageBucket();
  static const List<Widget> _pages = [
    HomePage(),
    CreateNewTaskPage(),
    AllTaskPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => exitDialog(context),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: AppDecoration.gradientBackground,
          child: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: PageStorage(
                  bucket: _pageStorageBucket,
                  child: IndexedStack(
                    key: ValueKey<int>(state.selectedIndex),
                    index: state.selectedIndex,
                    children: _pages,
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }

  Future exitDialog(BuildContext context) async {
    bool shouldExit = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("areYouSure".tr()),
          content: Text("areYouSureYouWantToExit".tr()),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text("no".tr()),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text("yes".tr()),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );

    if (shouldExit == true) {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    }
  }
}
