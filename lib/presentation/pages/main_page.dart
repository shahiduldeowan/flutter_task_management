import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/presentation/all_task/all_task_page.dart";
import "package:task/presentation/create_new_task/create_new_task_page.dart";
import "package:task/presentation/cubits/navigation/navigation_cubit.dart";
import "package:task/presentation/home/home_page.dart";
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
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
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

/*


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late final PageStorageBucket _bucket = PageStorageBucket();
  final List<Widget> _pages = const <Widget>[
    HomePage(),
    CreateNewTaskPage(),
    AllTaskPage()
  ];

  /// List of icons: [Unselected, Selected]
  final List<List<String>> _icons = [
    [AppAssets.svg.homeIcon.path, AppAssets.svg.homeFilledIcon.path],
    [AppAssets.svg.taskIcon.path, AppAssets.svg.taskIconFilled.path],
    [AppAssets.svg.calenderIcon.path, AppAssets.svg.calenderFilledIcon.path],
  ];

  int _selectedIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() => _selectedIndex = index);
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => exitDialog(context),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          decoration: AppDecoration.gradientBackground,
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: PageStorage(
                    bucket: _bucket,
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: _pages,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.maxFinite,
            margin: EdgeInsets.only(
              left: 20.h,
              right: 20.h,
              bottom: 14.h,
            ),
            child: IntrinsicHeight(
              child: SizedBox(
                width: double.maxFinite,
                child: Container(
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(34.h),
                    boxShadow: [
                      BoxShadow(
                        color:
                            theme.colorScheme.onPrimary.withValues(alpha: 0.2),
                        spreadRadius: 2.h,
                        blurRadius: 2.h,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      _icons.length,
                      (index) {
                        return AnimatedScale(
                          scale: _selectedIndex == index ? 1.0 : 0.9,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 60.h,
                            width: 107.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.h),
                              color: index == _selectedIndex
                                  ? appTheme.iceGray
                                  : null,
                            ),
                            child: GestureDetector(
                              onTap: () => _onItemTapped(index),
                              child: Center(
                                child: SvgPicture.asset(
                                  _selectedIndex == index
                                      ? _icons[index][1]
                                      : _icons[index][0],
                                  key: ValueKey<int>(_selectedIndex),
                                  width: 24.h,
                                  height: 24.h,
                                  colorFilter: _selectedIndex == index
                                      ? ColorFilter.mode(
                                          theme.colorScheme.primary,
                                          BlendMode.srcIn)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future exitDialog(BuildContext context) async {
    bool shouldExit = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("areYouSure".tr()),
          content: const Text("Are you sure you want to exit?"),
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

*/
