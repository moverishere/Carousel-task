part of 'carousel.dart';

/// This file defines the [MainCarouselController] class, which provides control
/// over a carousel widget in the Main (YouTube Lite) application.
/// It is part of the '../components.dart' module.
///
/// The [MainCarouselController] manages the state and behavior of the carousel,
/// allowing navigation between items, animation control, and timer management
/// for auto-play functionality.
///
/// The controller requires initialization with parameters such as the initial
/// page, total item count, carousel options, carousel type, and callback functions
/// for resetting and resuming the auto-play timer.
///
/// Example usage:
/// ```dart
/// final carouselController = MainCarouselController();
/// carouselController.init(
///   realPage: 0,
///   initialPage: 0,
///   itemCount: 5,
///   options: _MainCarouselOptions(
///     viewportFraction: 0.8,
///     pauseAutoPlayOnManualNavigate: true,
///     curve: Curves.easeInOut,
///   ),
///   carouselType: CarouselType.banner,
///   onResetTimer: () {
///     // Reset auto-play timer logic
///   },
///   onResumeTimer: () {
///     // Resume auto-play timer logic
///   },
/// );
/// ```

class MainCarouselController {
  MainCarouselController() : _initialPage = 0;

  int _initialPage;

  late PageController _pageController;
  late _MainCarouselOptions _options;
  late int _itemCount;
  late int _realPage;
  late void Function() _onResetTimer;
  late void Function() _onResumeTimer;
  late CarouselType _carouselType;

  int get realPage => _realPage;
  int get initialPage => _initialPage;
  int get itemCount => _itemCount;
  PageController get pageController => _pageController;

  // Methods

  /// Initializes the [MainCarouselController] with provided parameters.
  ///
  /// This method must be called before using other methods of the controller.
  /// Parameters:
  /// - `realPage`: The actual page index.
  /// - `initialPage`: The initial page index.
  /// - `itemCount`: Total number of items in the carousel.
  /// - `options`: Options for configuring the carousel behavior.
  /// - `carouselType`: Type of carousel.
  /// - `onResetTimer`: Callback function to reset auto-play timer.
  /// - `onResumeTimer`: Callback function to resume auto-play timer.
  ///
  void _init({
    required int realPage,
    required int initialPage,
    required int itemCount,
    required _MainCarouselOptions options,
    required CarouselType carouselType,
    required void Function() onResetTimer,
    required void Function() onResumeTimer,
  }) {
    _realPage = realPage;
    _initialPage = initialPage;
    _itemCount = itemCount;
    _carouselType = carouselType;
    _onResetTimer = onResetTimer;
    _onResumeTimer = onResumeTimer;
    _options = options;

    _pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: realPage,
    );
  }

  /// Hint animation for suggets the swipe for carousel
  void _hintAnimation() {
    final animationDuration = _options.hintAnimationDuration.inMilliseconds;
    final breakSwitchPageDuration = Duration(milliseconds: (animationDuration * 0.5).round());
    final toNextPageDuration = Duration(milliseconds: animationDuration);
    for (var i = 0; i < _options.hintAnimationRepeatCount; i++) {
      Future.delayed(Duration(milliseconds: i * (_options.hintAnimationTimeout + animationDuration)), () {
        _pageController.nextPage(duration: toNextPageDuration, curve: Curves.ease);
        Future.delayed(breakSwitchPageDuration, () {
          _pageController.previousPage(duration: toNextPageDuration, curve: Curves.ease);
        });
      });
    }
  }

  /// Animates the controlled [MainCarouselController] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  Future<void> nextPage({
    Duration? duration,
  }) async {
    duration ??= getDefaultDurationOfAnimation;
    final isNeedResetTimer = _options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _onResetTimer();
    }

    await pageController.nextPage(duration: duration, curve: _options.curve);
    if (isNeedResetTimer) {
      _onResumeTimer();
    }
  }

  /// Animates the controlled [MainCarouselController] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  Future<void> previousPage({
    Duration? duration,
  }) async {
    duration ??= getDefaultDurationOfAnimation;
    final isNeedResetTimer = _options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _onResetTimer();
    }

    await pageController.previousPage(duration: duration, curve: _options.curve);
    if (isNeedResetTimer) {
      _onResumeTimer();
    }
  }

  /// Gets the default duration of animation based on carousel type.
  ///
  Duration get getDefaultDurationOfAnimation {
    return switch (_carouselType) {
      CarouselType.banner => MainCarouselConsts.bannerAutoPlayAnimationDuration,
      CarouselType.item => MainCarouselConsts.itemAutoPlayAnimationDuration,
    };
  }
}
