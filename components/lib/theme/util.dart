
/// example: labalSmall!.copyWith(height: 32.0.toFigmaHeight(displaySmall!.fontSize!));
/// 
extension FigmaDimention on double {
  double toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}