part of '../carousel.dart';

/// Represents the theme data for a carousel pagination data.
///
/// This class extends the [ThemeExtension] class and implements the [Diagnosticable] mixin.
/// It provides customization options for carousel pagination data in the application.

class MainCarouselPaginationThemeData extends ThemeExtension<MainCarouselPaginationThemeData> with Diagnosticable {
  MainCarouselPaginationThemeData._({this.height = MainCarouselConsts.paginationBoxHeight});

  factory MainCarouselPaginationThemeData.of() {
    return MainCarouselPaginationThemeData._();
  }

  final double height;

  @override
  MainCarouselPaginationThemeData copyWith({
    double? height,
  }) {
    return MainCarouselPaginationThemeData._(
      height: height ?? this.height,
    );
  }

  @override
  MainCarouselPaginationThemeData lerp(
    covariant MainCarouselPaginationThemeData? other,
    double t,
  ) {
    if (other is! MainCarouselPaginationThemeData) return this;
    return MainCarouselPaginationThemeData._();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DoubleProperty('height', height),
    );
  }
}
