enum ScreenSize {
  compact(0.0),
  medium(600.0),
  expanded(840.0),
  large(1200.0),
  extraLarge(1600.0);

  const ScreenSize(this.minWidth);

  final double minWidth;

  static List<ScreenSize> get _ordered => [
        ScreenSize.compact,
        ScreenSize.medium,
        ScreenSize.expanded,
        ScreenSize.large,
        ScreenSize.extraLarge,
      ];

  static ScreenSize get largest => ScreenSize.expanded;

  static ScreenSize fromScreenWidth(double width) {
    var result = largest;
    while (width < result.minWidth) {
      final smaller = result.smaller;
      result = smaller;
    }
    return result;
  }

  ScreenSize get smaller {
    final index = _ordered.indexOf(this);
    return index > 0 ? _ordered[index - 1] : this;
  }
}
