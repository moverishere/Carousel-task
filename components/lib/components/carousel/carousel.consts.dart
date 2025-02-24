part of 'carousel.dart';

abstract class MainCarouselConsts {
  static const double bannerAspectRatio = 16 / 9;
  static const double bannerViewportFraction = 1;
  static const int bannerInitialPage = 0;
  static const int bannerDotsAmount = 5;
  static const bool bannerAnimateToClosest = true;
  static const bool bannerDisableGesture = false;
  static const bool bannerReverse = false;
  static const bool bannerPageSnapping = true;
  static const bool bannerPauseAutoPlayOnManualNavigate = true;
  static const bool bannerPauseAutoPlayInFiniteScroll = false;
  static const bool bannerPadEnds = true;
  static const Duration bannerAutoPlayAnimationDuration = Duration(milliseconds: 300);

  static const double itemAspectRatio = 16 / 9;
  static const double itemViewportFraction = 0.8;
  static const int itemInitialPage = 0;
  static const int itemDotsAmount = 5;
  static const bool itemAnimateToClosest = true;
  static const bool itemDisableGesture = false;
  static const bool itemReverse = false;
  static const bool itemPageSnapping = true;
  static const bool itemPauseAutoPlayOnManualNavigate = true;
  static const bool itemPauseAutoPlayInFiniteScroll = false;
  static const bool itemPadEnds = false;
  static const Duration itemAutoPlayAnimationDuration = Duration(milliseconds: 300);

  static const double paginationBoxHeight = 40;

  static const int minRealInfinitePage = 10000;

  static const double dotsRadius = 16;
  static const double dotsPaintStrokeWidth = 1;

  static const Duration hintAnimationDuration = Duration(milliseconds: 800);
  static const int hintAnimationTimeout = 1000;
}
