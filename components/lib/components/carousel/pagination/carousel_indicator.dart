part of '../carousel.dart';

typedef OnDotClicked = void Function(int index);

/// This class defines a carousel indicator in a carousel.
/// It provides various properties for customizing the appearance.
///
/// [pageController] A PageController responsible for controlling the pages in the carousel.
/// [maxPage] An integer representing the maximum number of pages in the carousel.
/// [maxDot] An integer representing the maximum number of dots to display in the indicator.
/// [carouselType] An enum CarouselType indicating the type of carousel (banner or item).
/// [animationDuration] An optional Duration representing the duration of the animation for the carousel indicator.
/// [carouselIsTouched] Information the indicator that carousel is touched and animation should stop.
///
class _MainCarouselIndicator extends StatefulWidget {
  _MainCarouselIndicator({
    required this.pageController,
    required this.maxPage,
    required this.maxDot,
    required this.carouselType,
    required this.carouselIsTouched,
    this.animationDuration,
  }) : assert(
          animationDuration == null || (animationDuration.inMilliseconds) > 800,
          'Min value of duration should be higer than 800',
        );

  /// [pageController] A PageController responsible for controlling the pages in the carousel.
  final PageController pageController;

  /// [maxPage] An integer representing the maximum number of pages in the carousel.
  final int maxPage;

  /// [maxDot] An integer representing the maximum number of dots to display in the indicator.
  final int maxDot;

  /// [animationDuration] An optional Duration representing the duration of the animation for the carousel indicator.
  final Duration? animationDuration;

  /// [carouselType] An enum CarouselType indicating the type of carousel (banner or item).
  final CarouselType carouselType;

  /// [carouselIsTouched] Information the indicator that carousel is touched and animation should stop.
  final bool carouselIsTouched;

  @override
  State<_MainCarouselIndicator> createState() => _MainCarouselIndicatorState();
}

class _MainCarouselIndicatorState extends State<_MainCarouselIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  double? _currentPage;

  @override
  void initState() {
    if (isAnimation) {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.animationDuration,
      );

      _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

      _animationController.forward(from: 0);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant _MainCarouselIndicator oldWidget) {
    if (isAnimation) {
      if (widget.carouselIsTouched != oldWidget.carouselIsTouched) {
        if (widget.carouselIsTouched) {
          _animationController
            ..forward(from: 0)
            ..stop();
        } else {
          _animationController.forward(from: 0);
        }
      } else if (oldWidget.animationDuration != widget.animationDuration) {
        _animationController
          ..duration = widget.animationDuration
          ..stop()
          ..forward(from: 0);
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (isAnimation) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MainCarouselIndicatorThemeData>() ?? MainCarouselIndicatorThemeData.of(context);

    Size calculateSize(
      int count,
    ) {
      return Size(
        ((theme.dotWidth + theme.spacing) * (count - 2)) +
            (isAnimation ? theme.bannerActiveDotWidth : theme.itemActiveDotWidth),
        theme.dotHeight,
      );
    }

    return AnimatedBuilder(
      animation: widget.pageController,
      builder: (context, _) {
        if (isAnimation && widget.pageController.page != _currentPage) {
          _currentPage = widget.pageController.page;
          _animationController
            ..duration = widget.animationDuration
            ..stop()
            ..forward(from: 0);
        }
        return CustomPaint(
          size: calculateSize(widget.maxPage > widget.maxDot ? widget.maxDot : widget.maxPage),
          painter: MainCarouselDotsPainter(
            animation: isAnimation ? _animation : null,
            visibleDots: widget.maxDot,
            offset: _offset,
            dotColor: theme.defaultDotColor,
            spacing: theme.spacing,
            dotWidth: theme.dotWidth,
            dotHeight: theme.dotHeight,
            activeDotWidth: switch (widget.carouselType) {
              CarouselType.banner => theme.bannerActiveDotWidth,
              CarouselType.item => theme.itemActiveDotWidth,
            },
            activeDotColor: theme.activeDotColor,
            maxPage: widget.maxPage,
          ),
        );
      },
    );
  }

  double get _offset {
    try {
      final offset = widget.pageController.page ?? widget.pageController.initialPage.toDouble();

      return offset % widget.maxPage;
    } catch (_) {
      return widget.pageController.initialPage.toDouble();
    }
  }

  bool get isAnimation => widget.animationDuration != null;
}
