import "package:flutter/material.dart";
import "package:task/core/utils/app_size_utils.dart";

/// Extension on [num] to provide responsive design utilities.
extension ResponsiveExtension on num {
  /// Returns the current width of the screen.
  double get _width => AppSizeUtils.width;

  /// Returns the height of an element based on the Figma design width.
  ///
  /// The height is calculated by multiplying the current width of the screen
  /// with the given [num] value and then dividing by the Figma design width.
  ///
  /// This allows for responsive design, where the height of an element is
  /// proportional to the width of the screen.
  double get h => ((this * _width) / FigmaDesign.width.get);

  /// Returns the font size based on the Figma design width.
  ///
  /// The font size is calculated by multiplying the current width of the screen
  /// with the given value and then dividing by the Figma design width.
  ///
  /// This allows for responsive design, where the font size is proportional to the
  /// width of the screen.
  double get fs => (this * _width) / FigmaDesign.width.get;
}

extension AppSizeFormatExtension on double {
  /// Convert the double value to a string with [fractionDigits] and parse it
  /// back to double.
  ///
  /// This is useful when you want to remove any trailing zeros from a double
  /// value, such as when rendering a size to the user interface.
  ///
  /// Example:
  ///
  ///     double size = 100.0;
  ///     double value = size.toDoubleValue(fractionDigits: 1); // 100.0
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  /// If the value is greater than 0, return the value. Otherwise, return
  /// [defaultValue] converted to double.
  ///
  /// This is useful when you want to ensure a size is not zero, such as when
  /// calculating a layout ratio.
  double isNonZero({num defaultValue = 0.0}) {
    return this > 0.0 ? this : defaultValue.toDouble();
  }

  /// Returns a [SizedBox] widget with the given height.
  ///
  /// This is useful when you want to create a box with a specific height, such
  /// as when creating a divider or a spacer.
  ///
  /// Example:
  ///
  ///     double height = 10.0;
  ///     SizedBox box = height.toHeightBox();
  SizedBox toHeightBox() {
    return SizedBox(height: this);
  }
}
