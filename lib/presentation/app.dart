import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:task/core/di/locator.dart";
import "package:task/core/routes/app_routes.dart";
import "package:task/core/theme/theme_helper.dart" show theme;
import "package:task/core/utils/app_size_utils.dart";
import "package:task/core/utils/navigator_service.dart";
import "package:task/l10n/l10n.dart";
import "package:task/presentation/cubits/navigation/navigation_cubit.dart";
import "package:task/presentation/cubits/task/task_list_cubit.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>(
              create: (navigatorContext) => sl<NavigationCubit>(),
            ),
            BlocProvider<TaskListCubit>(
              create: (tasklistContext) => sl<TaskListCubit>(),
            ),
          ],
          child: MaterialApp(
            title: "Task Management",
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: theme,
            navigatorKey: NavigatorService.navigatorKey,
            supportedLocales: L10n.all,
            locale: const Locale("en"),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            initialRoute: AppRoutes.initialRoute,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          ),
        );
      },
    );
  }
}
