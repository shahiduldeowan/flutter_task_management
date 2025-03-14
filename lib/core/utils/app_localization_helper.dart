import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:task/core/utils/navigator_service.dart";

extension AppLocalizationHelperExt on String {
  String tr() {
    final localization = AppLocalizations.of(
      NavigatorService.navigatorKey.currentState!.context,
    );

    return switch (this) {
      "appName" => localization?.appName ?? this,
      "goodMorning" => localization?.goodMorning ?? this,
      "summary" => localization?.summary ?? this,
      "assignedTasks" => localization?.assignedTasks ?? this,
      "completedTasks" => localization?.completedTasks ?? this,
      "todayTasks" => localization?.todayTasks ?? this,
      "areYouSure" => localization?.areYouSure ?? this,
      "areYouSureYouWantToExit" =>
        localization?.areYouSureYouWantToExit ?? this,
      "yes" => localization?.yes ?? this,
      "no" => localization?.no ?? this,
      "allTasks" => localization?.allTasks ?? this,
      "completed" => localization?.completed ?? this,
      "taskAddedSuccessfully" => localization?.taskAddedSuccessfully ?? this,
      "taskUpdatedSuccessfully" =>
        localization?.taskUpdatedSuccessfully ?? this,
      "taskDeletedSuccessfully" =>
        localization?.taskDeletedSuccessfully ?? this,
      "createNewTask" => localization?.createNewTask ?? this,
      "taskName" => localization?.taskName ?? this,
      "enterYourTaskName" => localization?.enterYourTaskName ?? this,
      "taskDescription" => localization?.taskDescription ?? this,
      "startDate" => localization?.startDate ?? this,
      "endDate" => localization?.endDate ?? this,
      "todo" => localization?.todo ?? this,
      "complete" => localization?.complete ?? this,
      "viewTask" => localization?.viewTask ?? this,
      "delete" => localization?.delete ?? this,
      _ => this,
    };
  }
}
