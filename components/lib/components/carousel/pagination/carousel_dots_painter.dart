part of '../carousel.dart';


/// This class defines a custom painter for drawing dots in a carousel.
/// It provides various properties for customizing the appearance of the dots.
///
/// To use this painter, you need to provide the following parameters:
/// - [offset] The current offset of the carousel.
/// - [dotColor] The color of inactive dots.
/// - [visibleDots] The maximum number of dots visible at a time.
/// - [spacing] The spacing between dots.
/// - [dotWidth] The width of each dot.
/// - [dotHeight] The height of each dot.
/// - [activeDotWidth] The width of the active dot.
/// - [activeDotColor] The color of the active dot.
/// - [maxPage] The maximum number of pages in the carousel.
/// - [animation] Optional animation for dot transitions.
/// - [dotRadius] Represents the radius of the dots used in the carousel.
/// - [dotPaint]  Represents the paint configuration used to draw the dots.
///
/// The `MainCarouselDotsPainter` class extends `CustomPainter` and implements
/// custom painting logic to draw dots based on the provided parameters.
class MainCarouselDotsPainter extends CustomPainter {
  MainCarouselDotsPainter({
    required this.offset,
    required this.dotColor,
    required this.visibleDots,
    required this.spacing,
    required this.dotWidth,
    required this.dotHeight,
    required this.activeDotWidth,
    required this.activeDotColor,
    required this.maxPage,
    this.animation,
    PaintingStyle? paintStyle,
    double? strokeWidth,
    double? radius,
  })  : dotRadius = Radius.circular(radius ?? MainCarouselConsts.dotsRadius),
        dotPaint = Paint()
          ..color = dotColor
          ..style = paintStyle ?? PaintingStyle.fill
          ..strokeWidth = strokeWidth ?? MainCarouselConsts.dotsPaintStrokeWidth,
        assert(
          visibleDots.isOdd,
          'number of visibleDots should not be divided by two',
        ),
        super(repaint: animation);

  /// - [offset] The current offset of the carousel.
  final double offset;

  /// - [dotWidth] The width of each dot.
  final double dotWidth;

  /// - [dotHeight] The height of each dot.
  final double dotHeight;

  /// - [activeDotWidth] The width of the active dot.
  final double activeDotWidth;

  /// - [spacing] The spacing between dots.
  final double spacing;

  /// - [visibleDots] The maximum number of dots visible at a time.
  final int visibleDots;

  /// - [maxPage] The maximum number of pages in the carousel.
  final int maxPage;

  /// - [dotRadius] Description: Represents the radius of the dots used in the carousel.
  final Radius dotRadius;

  /// - [dotPaint] Description: Represents the paint configuration used to draw the dots.
  final Paint dotPaint;

  /// - [dotColor] The color of inactive dots.
  final Color dotColor;

  /// - [activeDotColor] The color of the active dot.
  final Color activeDotColor;

  /// - [animation] Optional animation for dot transitions.
  final Animation<double>? animation;

  @override
  void paint(Canvas canvas, Size size) {
    final maxDots = maxPage > visibleDots ? visibleDots : maxPage;
    final current = offset.floor();
    final switchPoint = (maxDots / 2).floor();
    final firstVisibleDot =
        (current < switchPoint || maxPage - 1 < maxDots) ? 0 : min(current - switchPoint, maxPage - visibleDots);
    final lastVisibleDot = min(firstVisibleDot + maxDots, maxPage - 1);
    final inPreScrollRange = current < switchPoint;
    final inAfterScrollRange = current >= (maxPage - 1) - switchPoint;
    final willStartScrolling = (current + 1) == switchPoint + 1;
    final willStopScrolling = current + 1 == (maxPage - 1) - switchPoint;

    final dotOffset = offset - offset.toInt();

    var drawingOffset =
        -spacing + ((inPreScrollRange || inAfterScrollRange) ? 0 : -dotOffset * (spacing + dotWidth) / 2);

    const smallDotScale = 1.0;
    const activeScale = 0;

    void createAnimationingDot() {
      final value = animation?.value ?? 1;

      final yPos = size.height / 2;
      final xPos = drawingOffset + spacing;
      final rRect1 = RRect.fromLTRBAndCorners(
        xPos,
        yPos - dotHeight / 2,
        xPos + activeDotWidth * value,
        yPos + dotHeight / 2,
        topLeft: dotRadius,
        bottomLeft: dotRadius,
        topRight: value == 1 ? dotRadius : Radius.zero,
        bottomRight: value == 1 ? dotRadius : Radius.zero,
      );

      final rRect2 = RRect.fromLTRBAndCorners(
        rRect1.right,
        yPos - dotHeight / 2,
        rRect1.right + activeDotWidth * (1 - value),
        yPos + dotHeight / 2,
        topRight: dotRadius,
        bottomRight: dotRadius,
        topLeft: value == 0 ? dotRadius : Radius.zero,
        bottomLeft: value == 0 ? dotRadius : Radius.zero,
      );

      drawingOffset = rRect2.right;
      canvas
        ..drawRRect(rRect1, dotPaint..color = activeDotColor)
        ..drawRRect(rRect2, dotPaint..color = dotColor);
    }

    if (maxDots == 1) {
      createAnimationingDot();
      return;
    }

    for (var index = firstVisibleDot; index <= lastVisibleDot; index++) {
      var color = dotColor;

      var scale = 1.0;

      var width = dotWidth;
      final expansion = dotOffset / 2 * ((activeDotWidth - dotWidth) / .5);

      if (index == current) {
        if (offset.round() == offset && isAnimation) {
          createAnimationingDot();
          continue;
        }
        color = Color.lerp(activeDotColor, dotColor, dotOffset)!;
        if (offset > maxPage - 1 && maxPage > maxDots) {
          scale = 1 - (smallDotScale * dotOffset);
        } else {
          scale = 1 - (activeScale * dotOffset);
        }

        width = activeDotWidth - expansion;
      } else if (index == firstVisibleDot && offset > maxPage - 1) {
        color = Color.lerp(isAnimation ? dotColor : activeDotColor, dotColor, 1.0 - dotOffset)!;

        if (maxPage <= maxDots) {
          scale = 1 + (activeScale * dotOffset);
        } else {
          scale = smallDotScale + (((1 - smallDotScale) + activeScale) * dotOffset);
        }
      } else if (index - 1 == current) {
        color = Color.lerp(isAnimation ? dotColor : activeDotColor, dotColor, 1.0 - dotOffset)!;

        scale = 1.0 + (activeScale * dotOffset);
        width = dotWidth + expansion;
      } else if (maxPage - 1 < maxDots) {
        scale = 1.0;
      } else if (index == firstVisibleDot) {
        if (willStartScrolling) {
          scale = 1.0 * (1.0 - dotOffset);
        } else if (inAfterScrollRange) {
          scale = smallDotScale;
        } else if (!inPreScrollRange) {
          scale = smallDotScale * (1.0 - dotOffset);
        }
      } else if (index == firstVisibleDot + 1 && !(inPreScrollRange || inAfterScrollRange)) {
        scale = 1.0 - (dotOffset * (1.0 - smallDotScale));
      } else if (index == lastVisibleDot - 1.0) {
        if (inPreScrollRange) {
          scale = smallDotScale;
        } else if (!inAfterScrollRange) {
          scale = smallDotScale + ((1.0 - smallDotScale) * dotOffset);
        }
      } else if (index == lastVisibleDot) {
        if (inPreScrollRange) {
          scale = 0.0;
        } else if (willStopScrolling) {
          scale = dotOffset;
        } else if (!inAfterScrollRange) {
          scale = smallDotScale * dotOffset;
        }
      }

      final scaledWidth = width * scale;
      final scaledHeight = dotHeight * scale;
      final yPos = size.height / 2;

      final xPos = width / 2 + drawingOffset;

      final rRect = RRect.fromLTRBR(
        xPos - scaledWidth / 2 + (spacing / 2),
        yPos - scaledHeight / 2,
        xPos + scaledWidth / 2 + (spacing / 2),
        yPos + scaledHeight / 2,
        dotRadius * scale,
      );

      drawingOffset = rRect.right;

      canvas.drawRRect(rRect, dotPaint..color = color);
    }
  }

  @override
  bool shouldRepaint(covariant MainCarouselDotsPainter oldDelegate) {
    return oldDelegate.offset != offset;
  }

  bool get isAnimation => animation != null;
}
