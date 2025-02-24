part of 'carousel.dart';

/// This class defines options specific to an item carousel, extending the base [_MainCarouselOptions].
///
/// It provides additional configuration for item carousels, such as the height, aspect ratio,
/// viewport fraction, and various behavior settings.
///
/// Example usage:
/// ```dart
/// final itemCarouselOptions = MainItemCarouselOptions(
///   aspectRatio: 16 / 9,
///   viewportFraction: 0.85,
///   autoPlay: true,
///   autoPlayInterval: Duration(seconds: 5),
/// );
/// ```
class MainItemCarouselOptions extends _MainCarouselOptions {
  MainItemCarouselOptions({
    super.height,
    double? aspectRatio,
    double? viewportFraction,
    int? initialPage,
    int? hintAnimationRepeatCount,
    bool? infinitePagination,
    bool? animateToClosest,
    bool? reverse,
    bool? autoPlay,
    Duration? autoPlayInterval,
    Duration? autoPlayAnimationDuration,
    Duration? hintAnimationDuration,
    Duration? durationBeforeHintAnimation,
    int? hintAnimationTimeout,
    super.curve = Curves.fastOutSlowIn,
    super.clipBehavior = Clip.hardEdge,
    super.onScrolled,
    super.scrollPhysics,
    bool? pageSnapping,
    bool? pauseAutoPlayOnTouch,
    bool? pauseAutoPlayOnManualNavigate,
    bool? pauseAutoPlayInFiniteScroll,
    bool? padEnds,
    bool? displayArrows,
    bool? displayPagination,
    bool? disableGesture,
    bool? showHintAnimation,
    int? dotCount,
  }) : super(
          dotCount: dotCount ?? MainCarouselConsts.bannerDotsAmount,
          aspectRatio: aspectRatio ?? MainCarouselConsts.itemAspectRatio,
          viewportFraction: viewportFraction ?? MainCarouselConsts.itemViewportFraction,
          infinitePagination: infinitePagination ?? false,
          animateToClosest: animateToClosest ?? MainCarouselConsts.itemAnimateToClosest,
          reverse: reverse ?? MainCarouselConsts.itemReverse,
          autoPlay: autoPlay ?? false,
          pageSnapping: pageSnapping ?? MainCarouselConsts.itemPageSnapping,
          pauseAutoPlayOnTouch: pauseAutoPlayOnTouch ?? false,
          pauseAutoPlayOnManualNavigate:
              pauseAutoPlayOnManualNavigate ?? MainCarouselConsts.itemPauseAutoPlayOnManualNavigate,
          pauseAutoPlayInFiniteScroll: pauseAutoPlayInFiniteScroll ?? MainCarouselConsts.itemPauseAutoPlayInFiniteScroll,
          padEnds: padEnds ?? MainCarouselConsts.itemPadEnds,
          displayArrows: displayArrows ?? false,
          displayPagination: displayPagination ?? false,
          autoPlayInterval: autoPlayInterval ?? const Duration(milliseconds: 5000),
          autoPlayAnimationDuration: autoPlayAnimationDuration ?? MainCarouselConsts.itemAutoPlayAnimationDuration,
          initialPage: initialPage ?? MainCarouselConsts.itemInitialPage,
          disableGesture: disableGesture ?? MainCarouselConsts.itemDisableGesture,
          showHintAnimation: showHintAnimation ?? false,
          hintAnimationDuration: hintAnimationDuration ?? MainCarouselConsts.hintAnimationDuration,
          hintAnimationRepeatCount:
              hintAnimationRepeatCount ?? 1,
          durationBeforeHintAnimation:
              durationBeforeHintAnimation ?? const Duration(seconds: 2),
          hintAnimationTimeout: hintAnimationTimeout ?? MainCarouselConsts.hintAnimationTimeout,
        );
}

/// This class defines options specific to a banner carousel, extending the base [_MainCarouselOptions].
///
/// It provides additional configuration for banner carousels, such as the aspect ratio,
/// viewport fraction, and various behavior settings.
///
/// Example usage:
/// ```dart
/// final bannerCarouselOptions = MainbannerCarouselOptions(
///   aspectRatio: 16 / 9,
///   viewportFraction: 0.85,
///   autoPlay: true,
///   autoPlayInterval: Duration(seconds: 5),
/// );
/// ```
class MainBannerCarouselOptions extends _MainCarouselOptions {
  MainBannerCarouselOptions({
    super.height,
    double? aspectRatio,
    double? viewportFraction,
    int? initialPage,
    int? hintAnimationRepeatCount,
    bool? infinitePagination,
    bool? animateToClosest,
    bool? reverse,
    bool? autoPlay,
    Duration? autoPlayInterval,
    Duration? autoPlayAnimationDuration,
    Duration? hintAnimationDuration,
    Duration? durationBeforeHintAnimation,
    int? hintAnimationTimeout,
    super.curve = Curves.fastOutSlowIn,
    super.clipBehavior = Clip.hardEdge,
    super.onScrolled,
    super.scrollPhysics,
    bool? pageSnapping,
    bool? pauseAutoPlayOnTouch,
    bool? pauseAutoPlayOnManualNavigate,
    bool? pauseAutoPlayInFiniteScroll,
    bool? padEnds,
    bool? displayArrows,
    bool? displayPagination,
    bool? disableGesture,
    bool? showHintAnimation,
    int? dotCount,
  }) : super(
          dotCount: dotCount ?? MainCarouselConsts.bannerDotsAmount,
          aspectRatio: aspectRatio ?? MainCarouselConsts.bannerAspectRatio,
          viewportFraction: viewportFraction ?? MainCarouselConsts.bannerViewportFraction,
          infinitePagination: infinitePagination ?? false,
          animateToClosest: animateToClosest ?? MainCarouselConsts.bannerAnimateToClosest,
          reverse: reverse ?? MainCarouselConsts.bannerReverse,
          autoPlay: autoPlay ??false,
          pageSnapping: pageSnapping ?? MainCarouselConsts.bannerPageSnapping,
          pauseAutoPlayOnTouch: pauseAutoPlayOnTouch ?? false,
          pauseAutoPlayOnManualNavigate:
              pauseAutoPlayOnManualNavigate ?? MainCarouselConsts.bannerPauseAutoPlayOnManualNavigate,
          pauseAutoPlayInFiniteScroll: pauseAutoPlayInFiniteScroll ?? MainCarouselConsts.bannerPauseAutoPlayInFiniteScroll,
          padEnds: padEnds ?? MainCarouselConsts.bannerPadEnds,
          displayArrows: displayArrows ?? false,
          displayPagination: displayPagination ?? false,
          autoPlayInterval: autoPlayInterval ?? const Duration(milliseconds: 5000),
          autoPlayAnimationDuration: autoPlayAnimationDuration ?? MainCarouselConsts.bannerAutoPlayAnimationDuration,
          initialPage: initialPage ?? MainCarouselConsts.bannerInitialPage,
          disableGesture: disableGesture ?? MainCarouselConsts.bannerDisableGesture,
          showHintAnimation: showHintAnimation ?? false,
          hintAnimationDuration: hintAnimationDuration ?? MainCarouselConsts.hintAnimationDuration,
          hintAnimationRepeatCount:
              hintAnimationRepeatCount ?? 1,
          durationBeforeHintAnimation:
              durationBeforeHintAnimation ?? const Duration(seconds: 2),
          hintAnimationTimeout: hintAnimationTimeout ?? MainCarouselConsts.hintAnimationTimeout,
        );
}

/// This private class defines options for configuring a carousel, providing control over its behavior and appearance.
///
/// It allows customization of various aspects such as dot count, aspect ratio, viewport fraction,
/// initial page, looping behavior, autoplay settings, and more.
///
class _MainCarouselOptions {
  _MainCarouselOptions({
    required this.dotCount,
    required this.aspectRatio,
    required this.viewportFraction,
    required this.initialPage,
    required this.infinitePagination,
    required this.animateToClosest,
    required this.reverse,
    required this.autoPlay,
    required this.autoPlayInterval,
    required this.autoPlayAnimationDuration,
    required this.pageSnapping,
    required this.pauseAutoPlayOnTouch,
    required this.pauseAutoPlayOnManualNavigate,
    required this.pauseAutoPlayInFiniteScroll,
    required this.padEnds,
    required this.displayArrows,
    required this.displayPagination,
    required this.disableGesture,
    required this.showHintAnimation,
    required this.hintAnimationDuration,
    required this.durationBeforeHintAnimation,
    required this.hintAnimationRepeatCount,
    required this.hintAnimationTimeout,
    this.height,
    this.curve = Curves.fastOutSlowIn,
    this.clipBehavior = Clip.hardEdge,
    this.onScrolled,
    this.scrollPhysics,
  }) : assert(!(autoPlay && showHintAnimation), 'Autoplay cant have hint animation');

  /// The number of dots to display for pagination.
  final int dotCount;

  /// Set carousel height and overrides any existing [aspectRatio].
  final double? height;

  /// Aspect ratio is used if no height have been declared.
  ///
  /// Defaults to 16:9 aspect ratio.
  final double aspectRatio;

  /// The fraction of the viewport that each page should occupy.
  ///
  /// Defaults to 0.8, which means each page fills 80% of the carousel.
  final double viewportFraction;

  /// The initial page to show when first creating the [MainCarousel].
  ///
  /// Defaults to 0.
  final int initialPage;

  /// Indicates how many times the animation is repeated
  final int hintAnimationRepeatCount;

  ///Determines if carousel should loop infinitely or be limited to item length.
  ///
  ///Defaults to true, i.e. infinite loop.
  final bool infinitePagination;

  /// - `displayArrows`: Whether to display navigation arrows (e.g., next and previous arrows) in the carousel.
  final bool displayArrows;

  /// - `displayPagination`: Whether to display pagination dots at the bottom of the carousel indicating the current page.
  final bool displayPagination;

  /// - `disableGesture`: Whether to disable gesture-based navigation such as swiping.
  final bool disableGesture;

  ///Determines if carousel should loop to the closest occurrence of requested page.
  ///
  ///Defaults to true.
  final bool animateToClosest;

  /// Reverse the order of items if set to true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// Enables autoplay, sliding one page at a time.
  ///
  /// Use [autoPlayInterval] to determine the frequency of slides.
  /// Defaults to false.
  final bool autoPlay;

  /// Determines if there's a hint animation or not
  final bool showHintAnimation;

  /// Enables auto play, sliding one page at a time.
  ///
  /// Use [autoPlayInterval] to determent the frequency of slides.
  /// Defaults to false.
  final Duration autoPlayInterval;

  /// The animation duration between two transitioning pages while in auto playback.
  ///
  /// Defaults to 800 ms.
  final Duration autoPlayAnimationDuration;

  /// The animation duration of hint animation transitioning between pages
  final Duration hintAnimationDuration;

  /// Time before the hint animation is triggered
  final Duration durationBeforeHintAnimation;

  /// Constant one second for timeout of the hint animation
  final int hintAnimationTimeout;

  /// Determines the animation curve physics.
  ///
  /// Defaults to [Curves.fastOutSlowIn].
  final Curve curve;

  /// Called whenever the carousel is scrolled
  final ValueChanged<double?>? onScrolled;

  /// How the carousel should respond to user input.
  ///
  /// For example, determines how the items continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? scrollPhysics;

  /// Set to false to disable page snapping, useful for custom scroll behavior.
  ///
  /// Default to `true`.
  final bool pageSnapping;

  /// If `true`, the auto play function will be paused when user is interacting with
  /// the carousel, and will be resumed when user finish interacting.
  /// Default to `true`.
  final bool pauseAutoPlayOnTouch;

  /// If `true`, the auto play function will be paused when user is calling
  /// pageController's `nextPage` or `previousPage` or `animateToPage` method.
  /// And after the animation complete, the auto play will be resumed.
  /// Default to `true`.
  final bool pauseAutoPlayOnManualNavigate;

  /// If `infinitePagination` is `false`, and `autoPlay` is `true`, this option
  /// decide the carousel should go to the first item when it reach the last item or not.
  /// If set to `true`, the auto play will be paused when it reach the last item.
  /// If set to `false`, the auto play function will animate to the first item when it was
  /// in the last item.
  final bool pauseAutoPlayInFiniteScroll;

  /// Whether to add padding to both ends of the list.
  /// If this is set to true and [viewportFraction] < 1.0, padding will be added such that the first and last child slivers will be in the center of the viewport when scrolled all the way to the start or end, respectively.
  /// If [viewportFraction] >= 1.0, this property has no effect.
  /// This property defaults to true and must not be null.
  final bool padEnds;

  /// Exposed clipBehavior of PageView
  final Clip clipBehavior;

  _MainCarouselOptions copyWith({
    double? height,
    double? aspectRatio,
    double? viewportFraction,
    int? initialPage,
    int? hintAnimationRepeatCount,
    bool? infinitePagination,
    bool? reverse,
    bool? autoPlay,
    Duration? autoPlayInterval,
    Duration? autoPlayAnimationDuration,
    Duration? hintAnimationDuration,
    Duration? durationBeforeHintAnimation,
    int? hintAnimationTimeout,
    Curve? curve,
    ValueChanged<double?>? onScrolled,
    ScrollPhysics? scrollPhysics,
    bool? pageSnapping,
    bool? pauseAutoPlayOnTouch,
    bool? pauseAutoPlayOnManualNavigate,
    bool? pauseAutoPlayInFiniteScroll,
    Clip? clipBehavior,
    bool? padEnds,
    bool? displayArrows,
    bool? displayPagination,
    bool? disableGesture,
    bool? animateToClosest,
    bool? showHintAnimation,
    int? dotCount,
  }) =>
      _MainCarouselOptions(
        height: height ?? this.height,
        dotCount: dotCount ?? this.dotCount,
        aspectRatio: aspectRatio ?? this.aspectRatio,
        viewportFraction: viewportFraction ?? this.viewportFraction,
        initialPage: initialPage ?? this.initialPage,
        infinitePagination: infinitePagination ?? this.infinitePagination,
        reverse: reverse ?? this.reverse,
        autoPlay: autoPlay ?? this.autoPlay,
        autoPlayInterval: autoPlayInterval ?? this.autoPlayInterval,
        autoPlayAnimationDuration: autoPlayAnimationDuration ?? this.autoPlayAnimationDuration,
        curve: curve ?? this.curve,
        onScrolled: onScrolled ?? this.onScrolled,
        scrollPhysics: scrollPhysics ?? this.scrollPhysics,
        pageSnapping: pageSnapping ?? this.pageSnapping,
        pauseAutoPlayOnTouch: pauseAutoPlayOnTouch ?? this.pauseAutoPlayOnTouch,
        pauseAutoPlayOnManualNavigate: pauseAutoPlayOnManualNavigate ?? this.pauseAutoPlayOnManualNavigate,
        pauseAutoPlayInFiniteScroll: pauseAutoPlayInFiniteScroll ?? this.pauseAutoPlayInFiniteScroll,
        clipBehavior: clipBehavior ?? this.clipBehavior,
        padEnds: padEnds ?? this.padEnds,
        displayArrows: displayArrows ?? this.displayArrows,
        displayPagination: displayPagination ?? this.displayPagination,
        disableGesture: disableGesture ?? this.disableGesture,
        animateToClosest: animateToClosest ?? this.animateToClosest,
        showHintAnimation: showHintAnimation ?? this.showHintAnimation,
        hintAnimationDuration: hintAnimationDuration ?? this.hintAnimationDuration,
        hintAnimationRepeatCount: hintAnimationRepeatCount ?? this.hintAnimationRepeatCount,
        durationBeforeHintAnimation: durationBeforeHintAnimation ?? this.durationBeforeHintAnimation,
        hintAnimationTimeout: hintAnimationTimeout ?? this.hintAnimationTimeout,
      );
}
