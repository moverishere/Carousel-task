part of 'carousel.dart';

/// Define a typedef for a custom widget builder
typedef ExtendedIndexedWidgetBuilder =
    Widget Function(BuildContext context, int index, int realIndex);

/// A carousel is a dynamic and interactive display that shows a series of items,
/// such as images, videos, or cards, on a limited screen area.
/// It creates a sense of motion and continuity by smoothly moving the items, either individually or in groups,
/// to reveal the next ones. Users can control the movement through buttons or swipe gestures, or it can be automatic.
///
/// The banner carousel has an option for autoplay. In this option the content changes automatically after a set delay.
/// The selected pagination component (the pill shape one) has an animation of getting fill while the daily is happening.
///
/// Example usage:
/// ```dart
/// MainCarousel.item(
///     items: [
///       for (int index = 0; index < 10; index++)
///         Padding(
///           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
///           child: MainCard.elevated(
///             child: SizedBox(
///               height: 400,
///               child: Center(
///                 child: MainText('${index + 1}'),
///               ),
///             ),
///           ),
///         ),
///     ],
///     options: MainItemCarouselOptions(
///       height: 400,
///       displayArrows: showArrows,
///       displayPagination: showPagination,
///       pageSnapping: pageSnapping,
///       dotCount: numberOfDots,
///     ),
///   ),
/// );
///
/// MainCarousel.banner(
///     items: [
///       for (int index = 0; index < 10; index++)
///         Padding(
///           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
///           child: MainCard.elevated(
///             child: SizedBox(
///               height: 400,
///               child: Center(
///                 child: MainText('${index + 1}'),
///               ),
///             ),
///           ),
///         ),
///     ],
///     options: MainBannerCarouselOptions(
///       height: 400,
///       displayArrows: showArrows,
///       displayPagination: showPagination,
///       autoPlay: autoPlay,
///       infinitePagination: infinite,
///       pauseAutoPlayOnTouch: pauseOnHover,
///       autoPlayInterval: Duration(milliseconds: speed),
///       pageSnapping: pageSnapping,
///       dotCount: numberOfDots,
///     ),
///   ),
// );
/// ```
// ignore: comment_references
/// [options] Options for the carousel.
/// [items] List of items to be displayed in the carousel.
/// [carouselController] Carousel controller for managing carousel state.
///
class MainCarousel extends StatefulWidget {
  MainCarousel.item({
    required this.items,
    required MainItemCarouselOptions options,
    MainCarouselController? carouselController,
    super.key,
  }) : _options = options,
       _itemCount = items.length,
       _carouselType = CarouselType.item,
       carouselController = carouselController ?? MainCarouselController();

  MainCarousel.banner({
    required this.items,
    required MainBannerCarouselOptions options,
    MainCarouselController? carouselController,
    super.key,
  }) : _options = options,
       _itemCount = items.length,
       _carouselType = CarouselType.banner,
       carouselController = carouselController ?? MainCarouselController();

  /// List of items to be displayed in the carousel
  final List<Widget> items;

  /// Carousel controller for managing carousel state
  final MainCarouselController carouselController;

  /// Options for the carousel
  final _MainCarouselOptions _options;

  /// Total number of items in the carousel
  final int _itemCount;

  /// Type of the carousel (item or banner)
  final CarouselType _carouselType;

  /// Override createState method to create state for the carousel
  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel>
    with TickerProviderStateMixin {
  /// Declare carousel controller
  late MainCarouselController carouselController;

  /// Timer for auto-play functionality
  Timer? timer;

  /// [_carouselIsTouched] Information the indicator that carousel is touched and animation should stop.
  bool _carouselIsTouched = false;

  /// Get options of the carousel
  _MainCarouselOptions get options => widget._options;

  Timer? hintAnimationTimeout;

  @override
  void initState() {
    super.initState();
    initCarouselController();
    handleAutoPlay();

    if (options.showHintAnimation) {
      hintAnimationTimeout = Timer(
        widget._options.durationBeforeHintAnimation,
        () => carouselController._hintAnimation(),
      );
    }
  }

  @override
  void didUpdateWidget(MainCarousel oldWidget) {
    initCarouselController();
    handleAutoPlay();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    clearTimer();
  }

  /// Initialize carousel controller
  void initCarouselController() {
    widget.carouselController._init(
      realPage:
          options.infinitePagination
              ? MainCarouselConsts.minRealInfinitePage +
                  widget.carouselController.initialPage
              : widget.carouselController.initialPage,
      initialPage: options.initialPage,
      itemCount: widget._itemCount,
      onResetTimer: clearTimer,
      onResumeTimer: resumeTimer,
      options: options,
      carouselType: widget._carouselType,
    );

    carouselController = widget.carouselController;
  }

  /// Get auto-play timer
  Timer? getTimer() {
    if (!options.autoPlay) return null;
    Timer.periodic(options.autoPlayInterval, (_) {
      if (!mounted) {
        clearTimer();
        return;
      }

      var nextPage =
          (carouselController.pageController.page?.round() ??
              carouselController.pageController.initialPage) +
          1;

      if (nextPage >= widget._itemCount &&
          options.infinitePagination == false) {
        if (options.pauseAutoPlayInFiniteScroll) {
          clearTimer();
          return;
        }
        if (!options.infinitePagination) {
          clearTimer();
          return;
        }
        nextPage = 0;
      }

      carouselController.pageController.animateToPage(
        nextPage,
        duration: options.autoPlayAnimationDuration,
        curve: options.curve,
      );
    });
    return null;
  }

  /// Clear auto-play timer
  void clearTimer() {
    timer?.cancel();
    timer = null;
  }

  /// Resume auto-play timer
  void resumeTimer() {
    timer ??= getTimer();
  }

  /// Handle auto-play functionality
  void handleAutoPlay() {
    final autoPlayEnabled = options.autoPlay;

    if (autoPlayEnabled && timer != null) return;

    clearTimer();
    if (autoPlayEnabled) {
      resumeTimer();
    }
  }

  /// Handle touch down event
  void onPanDown() {
    if (options.pauseAutoPlayOnTouch) {
      clearTimer();
      setState(() {
        _carouselIsTouched = true;
      });
    }
    hintAnimationTimeout?.cancel();
  }

  /// Handle touch up event
  void onPanUp() {
    if (options.pauseAutoPlayOnTouch) {
      resumeTimer();
      setState(() {
        _carouselIsTouched = false;
      });
    }
  }

  /// Build the carousel slider
  Widget carouselSlider(BuildContext context) {
    return AbsorbPointer(
      absorbing: options.disableGesture,
      child: PageView.builder(
        padEnds: options.padEnds,
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          overscroll: false,
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        clipBehavior: options.clipBehavior,
        physics: options.scrollPhysics,
        pageSnapping: options.pageSnapping,
        controller: carouselController._pageController,
        reverse: options.reverse,
        itemCount: options.infinitePagination ? null : widget._itemCount,
        itemBuilder: (BuildContext context, int idx) {
          final index = _getRealIndex(
            idx + carouselController.initialPage,
            carouselController.realPage,
            widget._itemCount,
          );

          return AnimatedBuilder(
            animation: carouselController.pageController,
            child: widget.items[index],
            builder: (BuildContext context, child) {
              return child ?? const SizedBox();
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget._carouselType) {
      CarouselType.banner => _GestureWrapper(
        options: options,
        carouselController: carouselController,
        onPanDown: onPanDown,
        onPanUp: onPanUp,
        child: Stack(
          children: [
            Builder(builder: carouselSlider),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _MainCarouselPagination(
                    options: options,
                    carouselController: carouselController,
                    carouselType: widget._carouselType,
                    carouselIsTouched: _carouselIsTouched,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      CarouselType.item => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _GestureWrapper(
            options: options,
            carouselController: carouselController,
            onPanDown: onPanDown,
            onPanUp: onPanUp,
            child: Builder(builder: carouselSlider),
          ),
          SizedBox(height: 10),
          _MainCarouselPagination(
            options: options,
            carouselController: carouselController,
            carouselType: widget._carouselType,
            carouselIsTouched: _carouselIsTouched,
          ),
        ],
      ),
    };
  }
}

class _GestureWrapper extends StatelessWidget {
  const _GestureWrapper({
    required this.child,
    required this.options,
    required this.carouselController,
    required this.onPanDown,
    required this.onPanUp,
  });

  final _MainCarouselOptions options;
  final MainCarouselController carouselController;
  final Widget child;
  final void Function() onPanDown;
  final void Function() onPanUp;

  @override
  Widget build(BuildContext context) {
    final wrapper = switch (options.height != null) {
      true => SizedBox(height: options.height, child: child),
      false => AspectRatio(aspectRatio: options.aspectRatio, child: child),
    };

    if (options.disableGesture) {
      return NotificationListener(
        onNotification: (Notification notification) {
          if (options.onScrolled != null &&
              notification is ScrollUpdateNotification) {
            options.onScrolled!(carouselController.pageController.page);
          }
          return false;
        },
        child: wrapper,
      );
    }

    return RawGestureDetector(
      behavior: HitTestBehavior.opaque,
      gestures: {
        PanGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
              PanGestureRecognizer.new,
              (PanGestureRecognizer instance) {
                instance
                  ..onDown = (_) {
                    onPanDown();
                  }
                  ..onEnd = (_) {
                    onPanUp();
                  }
                  ..onCancel = onPanUp;
              },
            ),
      },
      child: NotificationListener(
        onNotification: (Notification notification) {
          if (options.onScrolled != null &&
              notification is ScrollUpdateNotification) {
            options.onScrolled!(carouselController.pageController.page);
          }
          return false;
        },
        child: wrapper,
      ),
    );
  }
}
