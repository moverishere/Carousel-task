part of 'theme.dart';

/// Dimensions used in app
/// every item should be in `8th point grid` never use numbers out of
///
/// 8, 16, 24, 32, 40, 48, 56, 64, 72
///
abstract class Dimens {
  /// Extra Extra Small size `2.0` logic pixels
  static const double s2 = 2;

  /// Extra Small size `4.0` logic pixels
  static const double s4 = 4;

  /// Small size `8.0` logic points
  static const double s8 = 8;

  /// Extra Smaller Medium Size `12.0` logic pixels
  static const double s12 = 12;

  /// Smaler Medium size `16.0` logic pixels
  static const double s16 = 16;

  /// Medium size `24.0` logic pixels
  static const double s24 = 24;

  /// Large size `32.0` logic pixels
  static const double s32 = 32;

  /// Extra Large size `40.0` logic pixels
  static const double s40 = 40;

  /// Extra Large size `48.0` logic pixels
  static const double s48 = 48;

  /// Extra Large size `56.0` logic pixels
  static const double s56 = 56;

  /// Extra Large size `64.0` logic pixels
  static const double s64 = 64;

  /// Extra Large size `72.0` logic pixels
  static const double s72 = 72;

  /// Extra Large size `80.0` logic pixels
  static const double s80 = 80;

  /// Extra Large size `88.0` logic pixels
  static const double s88 = 88;

  /// Extra Large size `96.0` logic pixels
  static const double s96 = 96;
}

extension EdgeInsetsShorts on EdgeInsets {
  static const EdgeInsetsGeometry all2 = EdgeInsets.all(Dimens.s2);
  static const EdgeInsetsGeometry all4 = EdgeInsets.all(Dimens.s4);
  static const EdgeInsetsGeometry all8 = EdgeInsets.all(Dimens.s8);
  static const EdgeInsetsGeometry all12 = EdgeInsets.all(Dimens.s12);
  static const EdgeInsetsGeometry all16 = EdgeInsets.all(Dimens.s16);
  static const EdgeInsetsGeometry all32 = EdgeInsets.all(Dimens.s32);
  static const EdgeInsetsGeometry all48 = EdgeInsets.all(Dimens.s48);

  static const EdgeInsetsGeometry h2 = EdgeInsets.symmetric(horizontal: Dimens.s2);
  static const EdgeInsetsGeometry h4 = EdgeInsets.symmetric(horizontal: Dimens.s4);
  static const EdgeInsetsGeometry h8 = EdgeInsets.symmetric(horizontal: Dimens.s8);
  static const EdgeInsetsGeometry h16 = EdgeInsets.symmetric(horizontal: Dimens.s16);
  static const EdgeInsetsGeometry h24 = EdgeInsets.symmetric(horizontal: Dimens.s24);
  static const EdgeInsetsGeometry h32 = EdgeInsets.symmetric(horizontal: Dimens.s32);
  static const EdgeInsetsGeometry h48 = EdgeInsets.symmetric(horizontal: Dimens.s48);

  static const EdgeInsetsGeometry v2 = EdgeInsets.symmetric(vertical: Dimens.s2);
  static const EdgeInsetsGeometry v4 = EdgeInsets.symmetric(vertical: Dimens.s4);
  static const EdgeInsetsGeometry v8 = EdgeInsets.symmetric(vertical: Dimens.s8);
  static const EdgeInsetsGeometry v16 = EdgeInsets.symmetric(vertical: Dimens.s16);
  static const EdgeInsetsGeometry v32 = EdgeInsets.symmetric(vertical: Dimens.s32);
  static const EdgeInsetsGeometry v48 = EdgeInsets.symmetric(vertical: Dimens.s48);
}

/// Use for vertical or horizontal gap between widgets
///
/// - ***h24*** = `horizontal` space with `24.0` logic pixels
/// - ***v8*** = `vertical` space with `8.0` logic pixels
///
/// ```dart
/// Column(children: [
///   Icon(Icons.mail),
///   // adding 24.0 space
///   Gap.v24,
///   Icon(Icons.mail),
///   ...
/// ])
/// ```
/// > Example in row
///
abstract class Gap {
  /// Small Sizedbox with `height` = `2.0` logic pixels
  static const v2 = SizedBox(height: Dimens.s2);

  /// Small Sizedbox with `height` = `4.0` logic pixels
  static const v4 = SizedBox(height: Dimens.s4);

  /// Small Sizedbox with `height` = `8.0` logic pixels
  static const v8 = SizedBox(height: Dimens.s8);

  /// Small Sizedbox with `height` = `12.0` logic pixels
  static const v12 = SizedBox(height: Dimens.s12);

  /// Small Sizedbox with `height` = `16.0` logic pixels
  static const v16 = SizedBox(height: Dimens.s16);

  /// Small Sizedbox with `height` = `24.0` logic pixels
  static const v24 = SizedBox(height: Dimens.s24);

  /// Small Sizedbox with `height` = `32.0` logic pixels
  static const v32 = SizedBox(height: Dimens.s32);

  /// Small Sizedbox with `height` = `40.0` logic pixels
  static const v40 = SizedBox(height: Dimens.s40);

  /// Small Sizedbox with `height` = `48.0` logic pixels
  static const v48 = SizedBox(height: Dimens.s48);

  /// Small Sizedbox with `height` = `56.0` logic pixels
  static const v56 = SizedBox(height: Dimens.s56);

  /// Small Sizedbox with `height` = `64.0` logic pixels
  static const v64 = SizedBox(height: Dimens.s64);

  /// Small Sizedbox with `height` = `72.0` logic pixels
  static const v72 = SizedBox(height: Dimens.s72);

  /// SizedBox with zero height
  static const h0 = SizedBox.shrink();

  /// Small Sizedbox with `width` = `2.0` logic pixels
  static const h2 = SizedBox(width: Dimens.s2);

  /// Small Sizedbox with `width` = `4.0` logic pixels
  static const h4 = SizedBox(width: Dimens.s4);

  /// Small Sizedbox with `width` = `8.0` logic pixels
  static const h8 = SizedBox(width: Dimens.s8);

  /// Small Sizedbox with `width` = `12.0` logic pixels
  static const h12 = SizedBox(width: Dimens.s12);

  /// Small Sizedbox with `width` = `16.0` logic pixels
  static const h16 = SizedBox(width: Dimens.s16);

  /// Small Sizedbox with `width` = `24.0` logic pixels
  static const h24 = SizedBox(width: Dimens.s24);

  /// Small Sizedbox with `width` = `32.0` logic pixels
  static const h32 = SizedBox(width: Dimens.s32);

  /// Small Sizedbox with `width` = `40.0` logic pixels
  static const h40 = SizedBox(width: Dimens.s40);

  /// Small Sizedbox with `width` = `48.0` logic pixels
  static const h48 = SizedBox(width: Dimens.s48);

  /// Small Sizedbox with `width` = `56.0` logic pixels
  static const h56 = SizedBox(width: Dimens.s56);

  /// Small Sizedbox with `width` = `64.0` logic pixels
  static const h64 = SizedBox(width: Dimens.s64);

  /// Small Sizedbox with `width` = `72.0` logic pixels
  static const h72 = SizedBox(width: Dimens.s72);
}
