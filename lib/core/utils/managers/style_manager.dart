import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/color_manager.dart';
import 'package:netflix_clone/core/utils/managers/font_manager.dart';

abstract class StyleManager {
  static TextStyle styleMedium12(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.primaryColor,
      fontSize: getResponsiveFontSize(
        context,
        fontSize: FontSize.s12,
      ),
      fontWeight: FontWeights.medium,
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.primaryColor,
      fontSize: getResponsiveFontSize(
        context,
        fontSize: FontSize.s14,
      ),
      fontWeight: FontWeights.medium,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.primaryColor,
      fontSize: getResponsiveFontSize(
        context,
        fontSize: FontSize.s16,
      ),
      fontWeight: FontWeights.medium,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.primaryColor,
      fontSize: getResponsiveFontSize(
        context,
        fontSize: FontSize.s18,
      ),
      fontWeight: FontWeights.medium,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.primaryColor,
      fontSize: getResponsiveFontSize(
        context,
        fontSize: FontSize.s16,
      ),
      fontWeight: FontWeights.bold,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.primaryColor,
      fontSize: getResponsiveFontSize(
        context,
        fontSize: FontSize.s18,
      ),
      fontWeight: FontWeights.bold,
    );
  }
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
