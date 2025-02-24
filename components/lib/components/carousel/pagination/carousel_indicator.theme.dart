part of '../carousel.dart';

/// Represents the theme data for a carousel indicator theme data.
///
/// This class extends the [ThemeExtension] class and implements the [Diagnosticable] mixin.
/// It provides customization options for carousel indicator theme data in the application.

class MainCarouselIndicatorThemeData extends ThemeExtension<MainCarouselIndicatorThemeData> with Diagnosticable {
  MainCarouselIndicatorThemeData._({
    required this.defaultDotColor,
    required this.activeDotColor,
    double? dotWidth,
    double? itemActiveDotWidth,
    double? bannerActiveDotWidth,
    double? dotHeight,
    double? spacing,
  })  : dotWidth = dotWidth ?? MainCarouselConfig.dotWidth,
        itemActiveDotWidth = itemActiveDotWidth ?? MainCarouselConfig.itemActiveDotWidth,
        bannerActiveDotWidth = bannerActiveDotWidth ?? MainCarouselConfig.bannerActiveDotWidth,
        dotHeight = dotHeight ?? MainCarouselConfig.dotHeight,
        spacing = spacing ?? MainCarouselConfig.spacing;


  factory MainCarouselIndicatorThemeData.of(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MainCarouselIndicatorThemeData._(
      defaultDotColor: colorScheme.primaryFixed,
      activeDotColor: colorScheme.inversePrimary,
    );
  }

  final Color defaultDotColor;
  final Color activeDotColor;
  final double dotWidth;
  final double itemActiveDotWidth;
  final double bannerActiveDotWidth;
  final double dotHeight;
  final double spacing;

  @override
  MainCarouselIndicatorThemeData copyWith({
    Color? defaultDotColor,
    Color? activeDotColor,
    double? activeDotWidth,
    double? itemActiveDotWidth,
    double? bannerActiveDotWidth,
    double? dotWidth,
    double? dotHeight,
    double? spacing,
  }) {
    return MainCarouselIndicatorThemeData._(
      defaultDotColor: defaultDotColor ?? this.defaultDotColor,
      activeDotColor: activeDotColor ?? this.activeDotColor,
      itemActiveDotWidth: itemActiveDotWidth ?? this.itemActiveDotWidth,
      bannerActiveDotWidth: bannerActiveDotWidth ?? this.bannerActiveDotWidth,
      dotWidth: dotWidth ?? this.dotWidth,
      dotHeight: dotHeight ?? this.dotHeight,
      spacing: spacing ?? this.spacing,
    );
  }

  @override
  MainCarouselIndicatorThemeData lerp(
    covariant MainCarouselIndicatorThemeData? other,
    double t,
  ) {
    if (other is! MainCarouselIndicatorThemeData) return this;
    return MainCarouselIndicatorThemeData._(
      defaultDotColor: Color.lerp(defaultDotColor, other.defaultDotColor, t)!,
      activeDotColor: Color.lerp(activeDotColor, other.activeDotColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(
        ColorProperty('defaultDotColor', defaultDotColor),
      )
      ..add(
        ColorProperty('activeDotColor', activeDotColor),
      )
      ..add(
        DoubleProperty('dotWidth', dotWidth),
      )
      ..add(
        DoubleProperty('itemActiveDotWidth', itemActiveDotWidth),
      )
      ..add(
        DoubleProperty('bannerActiveDotWidth', bannerActiveDotWidth),
      )
      ..add(
        DoubleProperty('dotHeight', dotHeight),
      )
      ..add(
        DoubleProperty('spacing', spacing),
      );
  }
}
