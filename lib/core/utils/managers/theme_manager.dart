import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/color_manager.dart';

abstract class ThemeManager {
  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.secondaryColor,
  );
}
