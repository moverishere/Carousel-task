import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
part 'theme.colorschemes.dart';
part 'theme.spacing.dart';
part 'theme.texttheme.dart';
part 'theme.widget_themes.dart';
part 'theme.extensions.dart';

class MainTheme {
  factory MainTheme() => _instance;

  MainTheme._() {
    light = createTheme(colorScheme: _MainColorSchemes.mainLightColorScheme);
    dark = createTheme(colorScheme: _MainColorSchemes.mainDarkColorScheme);
  }

  static final MainTheme _instance = MainTheme._();
  late final ThemeData dark;
  late final ThemeData light;

  ThemeData createTheme({
    required ColorScheme colorScheme,
    bool useMaterial3 = true,
  }) {
    final textTheme = baseTextTheme.apply(
      displayColor: colorScheme.onSurface,
      bodyColor: colorScheme.onSurface,
    );

    final widgetThemes = _MainWidgetThemes(
      basicColorScheme: colorScheme,
      basicTextScheme: textTheme,
    );

    final iconThemeData = widgetThemes.iconThemeData();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      tabBarTheme: TabBarTheme(
        tabAlignment: TabAlignment.start,
        dividerColor: colorScheme.outline,
      ),
      textTheme: textTheme,
      iconTheme: iconThemeData,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: ZoomPageTransitionsBuilder(),
          TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        },
      ),
    );
  }
}
