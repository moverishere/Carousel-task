part of 'carousel.dart';

class MainCarouselConfig {
  static Duration animationSpeed = const Duration(milliseconds: 5000);
  static Duration durationBeforeHintAnimation = const Duration(seconds: 2);
  static int hintAnimationRepeatCount = 1;
  static double dotWidth = 8;
  static double itemActiveDotWidth = 24;
  static double bannerActiveDotWidth = 40;
  static double dotHeight = 8;
  static double spacing = 4;

  static bool autoPlay = false;
  static bool displayArrows = false;
  static bool displayPagination = false;
  static bool infinitePagination = false;
  static bool pauseOnHover = false;
  static bool showHintAnimation = false;
}
