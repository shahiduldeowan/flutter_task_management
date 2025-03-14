import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:task/core/constants/app_sizes.dart";
import "package:task/core/extensions/app_size_extension.dart";
import "package:task/core/theme/app_decoration.dart";
import "package:task/core/theme/theme_helper.dart";
import "package:task/core/utils/app_localization_helper.dart";
import "package:task/core/utils/date_formatter.dart";
import "package:task/generated/assets.gen.dart";
import "package:task/presentation/widgets/shared/input_field/build_custom_text_form_field.dart";

class BuildTaskForm extends StatelessWidget {
  const BuildTaskForm({
    super.key,
    required this.taskNameController,
    required this.taskDescriptionController,
    required this.startDateController,
    required this.endDateController,
    required this.buttonLabel,
    this.onTaskCreated,
  });

  final TextEditingController taskNameController;
  final TextEditingController taskDescriptionController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final String buttonLabel;
  final void Function()? onTaskCreated;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingXL.h, vertical: AppSizes.paddingXXL.h),
      decoration: AppDecoration.filledPrimaryContainerBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilledLabel("taskName".tr()),
          6.h.toHeightBox(),
          _buildTaskNameInputField(),
          10.h.toHeightBox(),
          _buildFilledLabel("taskDescription".tr()),
          6.h.toHeightBox(),
          _buildTaskDescriptionInputField(),
          10.h.toHeightBox(),
          _buildDateSelectionRow(context),
          32.h.toHeightBox(),
          _formButton(),
        ],
      ),
    );
  }

  SizedBox _formButton() {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onTaskCreated,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: AppSizes.paddingL.h),
          backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyles.roundedBorder34,
          ),
        ),
        child: Text(
          buttonLabel,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildCounter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    const Color secondaryColor = Color(0xFF6E7591);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$currentLength",
            style: theme.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: currentLength > 0
                  ? theme.colorScheme.primary
                  : secondaryColor,
            ),
          ),
          TextSpan(
            text: " / ",
            style: theme.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: secondaryColor,
            ),
          ),
          TextSpan(
            text: "$maxLength",
            style: theme.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilledLabel(String label) {
    return Text(
      label,
      style: theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTaskNameInputField() {
    return BuildCustomTextFormField(
      controller: taskNameController,
      hintText: "enterYourTaskName".tr(),
      contentPadding: EdgeInsets.symmetric(
          vertical: AppSizes.paddingMM.h, horizontal: AppSizes.paddingL.h),
      validator: (value) => value == null || value.isEmpty
          ? "Please enter your task name!"
          : null,
    );
  }

  Widget _buildTaskDescriptionInputField() {
    return BuildCustomTextFormField(
      controller: taskDescriptionController,
      contentPadding: EdgeInsets.all(12.h),
      hintText: "Description here....",
      maxLines: 5,
      maxLength: 120,
      validator: (value) => value == null || value.isEmpty
          ? "Please enter your task description!"
          : null,
      buildCounte: _buildCounter,
    );
  }

  Widget _buildDateSelectionRow(BuildContext context) {
    return Row(
      spacing: 12.h,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6.h,
            children: [
              _buildFilledLabel("startDate".tr()),
              _buildDateField(startDateController, context),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6.h,
            children: [
              _buildFilledLabel("endDate".tr()),
              _buildDateField(endDateController, context, isEnd: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(
    TextEditingController controller,
    BuildContext context, {
    bool isEnd = false,
  }) {
    Widget myInputField() => BuildCustomTextFormField(
          readOnly: true,
          controller: controller,
          suffix: SvgPicture.asset(
            AppAssets.svg.calenderIcon.path,
            height: 16.h,
            width: 16.h,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          onTap: () async {
            var dateTime = await _selectDate(context);
            if (dateTime != null) {
              controller.text = DateFormatter.defaultDateFormat(dateTime);
            }
          },
        );

    if (!isEnd) {
      return Opacity(
        opacity: 0.6,
        child: myInputField(),
      );
    }
    return myInputField();
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }
}
