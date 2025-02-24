part of 'theme.dart';

extension SystemUiOverlayStyleExtension on SystemUiOverlayStyle {
  static SystemUiOverlayStyle defaultTheme(ColorScheme colorScheme) {
    return colorScheme.isDark
        ? SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: colorScheme.surface,
        )
        : SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: colorScheme.surface,
        );
  }
}

extension BrightnesExtension on Brightness {
  bool get isDark => this == Brightness.dark;
}

extension BuildContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
