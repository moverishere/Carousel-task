// ignore_for_file: unused_local_variable

part of 'theme.dart';

/// The class that contains the themes for the widgets
///
class _MainWidgetThemes {
  final ColorScheme basicColorScheme;
  final TextTheme basicTextScheme;

  _MainWidgetThemes({
    required this.basicColorScheme,
    required this.basicTextScheme,
  });

  ButtonThemeData buttonThemeData({ColorScheme? scheme}) {
    final colorScheme = scheme ?? basicColorScheme;
    return const ButtonThemeData(height: Dimens.s48);
  }

  IconThemeData iconThemeData({ColorScheme? scheme}) {
    final colorScheme = scheme ?? basicColorScheme;
    return IconThemeData(color: colorScheme.primary);
  }
}
