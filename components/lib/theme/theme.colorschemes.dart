// ignore_for_file: unused_local_variable

part of 'theme.dart';
class _MainColorSchemes {
  static Color get defaultTextLight => mainLightColorScheme.onSurface;
  static Color get defaultTextDark => mainDarkColorScheme.onSurface;

  /// “Supressed” text often means a lower-contrast text color.
  /// A common approach is to use onSurfaceVariant.
  static Color get supressedText => mainLightColorScheme.onSurfaceVariant;
  static Color get supressedTextDark => mainDarkColorScheme.onSurfaceVariant;

  /// “Destructive” text usually aligns to `error`.
  static Color get destructiveText => mainLightColorScheme.error;
  static Color get destructiveTextDark => mainDarkColorScheme.error;

  /// “Hover destructive background” often uses `errorContainer`.
  static Color get hoverDestructiveBackground =>
      mainLightColorScheme.errorContainer;
  static Color get hoverDestructiveBackgroundDark =>
      mainDarkColorScheme.errorContainer;

  /// “Disabled background” might use a neutral container color—often `surfaceVariant`
  /// or one of the “surfaceContainer” tokens.
  static Color get disabledBackground => mainLightColorScheme.surfaceContainerHighest;
  static Color get disabledBackgroundDark => mainDarkColorScheme.surfaceContainerHighest;

  /// “Hover primary color” is often the `primaryContainer`.
  static Color get hoverPrimaryColor => mainLightColorScheme.primaryContainer;
  static Color get hoverPrimaryColorDark =>
      mainDarkColorScheme.primaryContainer;

  static ColorScheme get mainLightColorScheme => const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00356f),
      surfaceTint: Color(0xff365e9d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff466dad),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff29364f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff606d88),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff54205b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff915896),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff0f1115),
      onSurfaceVariant: Color(0xff32363f),
      outline: Color(0xff4f525c),
      outlineVariant: Color(0xff696d77),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3035),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xff466dad),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2b5493),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff606d88),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff48556f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff915896),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff76407c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6c6cc),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3f9),
      surfaceContainer: Color(0xffe8e7ed),
      surfaceContainerHigh: Color(0xffdcdce2),
      surfaceContainerHighest: Color(0xffd1d1d7),
  );

  static ColorScheme get mainDarkColorScheme => const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcdddff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff002551),
      primaryContainer: Color(0xff769cdf),
      onPrimaryContainer: Color(0xff000c22),
      secondary: Color(0xffcfddfc),
      onSecondary: Color(0xff18263d),
      secondaryContainer: Color(0xff8391ad),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffccff),
      onTertiary: Color(0xff410d49),
      tertiaryContainer: Color(0xffc486c8),
      onTertiaryContainer: Color(0xff1d0023),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121317),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd9dce8),
      outline: Color(0xffaeb2bd),
      outlineVariant: Color(0xff8d909b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e8),
      inversePrimary: Color(0xff1a4785),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112b),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff00356f),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff031127),
      secondaryFixedDim: Color(0xffb9c7e5),
      onSecondaryFixedVariant: Color(0xff29364f),
      tertiaryFixed: Color(0xffffd6fe),
      onTertiaryFixed: Color(0xff25002c),
      tertiaryFixedDim: Color(0xfff2b0f5),
      onTertiaryFixedVariant: Color(0xff54205b),
      surfaceDim: Color(0xff121317),
      surfaceBright: Color(0xff434449),
      surfaceContainerLowest: Color(0xff06070b),
      surfaceContainerLow: Color(0xff1c1e22),
      surfaceContainer: Color(0xff26282c),
      surfaceContainerHigh: Color(0xff313237),
      surfaceContainerHighest: Color(0xff3c3d42),
  );
}

extension ColorSchemeExtension on ColorScheme {
  bool get isDark => brightness == Brightness.dark;

  /// “Supressed text” => `onSurfaceVariant` is a common choice
  Color get supressedText => onSurfaceVariant;

  /// “Destructive text” => typically `error`.
  Color get destructiveText => error;

  /// “Disabled background” => often `surfaceVariant` or a related container.
  Color get disabledBackground => surfaceContainerHighest;

  /// “Hover background” for a primary button => often `primaryContainer`.
  Color get hoverBackground => primaryContainer;

  /// Text on that hover background => typically `onPrimaryContainer`.
  Color get onHoverBackground => onPrimaryContainer;

  /// “Hover destructive background” => `errorContainer`.
  Color get hoverDestructiveBackground => errorContainer;
}

