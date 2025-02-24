part of '../carousel.dart';

/// This class defines a custom carousel pagination in a carousel.
/// It provides various properties for customizing the appearance.
///
/// [carouselController] An instance of MainCarouselController responsible for managing the carousel.
/// [options] An instance of _MainCarouselOptions containing configuration options for the carousel.
/// [carouselType] An enum indicating the type of carousel.
/// [carouselIsTouched] Information the indicator that carousel is touched and animation should stop.
class _MainCarouselPagination extends StatelessWidget {
  const _MainCarouselPagination({
    required this.carouselController,
    required this.options,
    required this.carouselType,
    required this.carouselIsTouched,
  });

  /// [carouselController] An instance of MainCarouselController responsible for managing the carousel.
  final MainCarouselController carouselController;

  /// [options] An instance of _MainCarouselOptions containing configuration options for the carousel.
  final _MainCarouselOptions options;

  /// [carouselType] An enum indicating the type of carousel.
  final CarouselType carouselType;

  /// [carouselIsTouched] Information the indicator that carousel is touched and animation should stop.
  final bool carouselIsTouched;

  @override
  Widget build(BuildContext context) {
   final themePagination = Theme.of(context).extension<MainCarouselPaginationThemeData>() ?? MainCarouselPaginationThemeData.of();
   final colorTheme = Theme.of(context).colorScheme;

    return (options.displayArrows || options.displayPagination)
        ? AnimatedBuilder(
            animation: carouselController.pageController,
            builder: (context, _) {
              final itemCount = carouselController.itemCount;
              final currentPage = _getRealIndex(
                (carouselController.pageController.page ?? 0).toInt() + carouselController.initialPage,
                carouselController.realPage,
                itemCount,
              );
              return SizedBox(
                height: themePagination.height,
                child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (options.displayArrows)
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: Dimens.s16,
                        color: colorTheme.primaryFixed,
                      ),
                      onPressed:
                          options.infinitePagination || 0 < currentPage
                              ? carouselController.previousPage
                              : null,
                    ),
                    if (options.displayPagination)
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Gap.v48,
                            _MainCarouselIndicator(
                              pageController: carouselController.pageController,
                              animationDuration: options.autoPlay && carouselType == CarouselType.banner
                                  ? options.autoPlayInterval - options.autoPlayAnimationDuration
                                  : null,
                              carouselType: carouselType,
                              maxPage: carouselController.itemCount,
                              maxDot: options.dotCount,
                              carouselIsTouched: carouselIsTouched,
                            ),
                            Gap.v48,
                          ],
                        ),
                      )
                    else
                      Gap.h8,
                    if (options.displayArrows)
                       IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        size: Dimens.s16,
                        color: colorTheme.primaryFixed,
                      ),
                         onPressed: options.infinitePagination || itemCount - 1 > currentPage
                            ? carouselController.nextPage
                            : null,
                    ),
                  ],
                ),
              );
            },
          )
        : const SizedBox();
  }
}
