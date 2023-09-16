import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Label text style
  static get labelLargeInterGray300 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray300,
        fontWeight: FontWeight.w800,
      );
  static get labelLargeInterGray80001 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w800,
      );
  static get labelLargeInterWhiteA700 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          12,
        ),
        fontWeight: FontWeight.w800,
      );
  static get labelLargeInterWhiteA700ExtraBold =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w800,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          12,
        ),
      );
  static get labelSmallSFProDisplay =>
      theme.textTheme.labelSmall!.sFProDisplay.copyWith(
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleMediumInterGray200 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray200,
        fontSize: getFontSize(
          18,
        ),
        fontWeight: FontWeight.w800,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}
