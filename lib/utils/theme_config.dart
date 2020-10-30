class ThemeConfig {
  /// 通用色
  static int colorTheme = 0xFF6175FF; /// 主色调: 蓝色

  static int color000 = 0xFF000000;
  static int color333 = 0xFF333333;
  static int color666 = 0xFF666666;
  static int color999 = 0xFF999999;
  static int colorCCC = 0xFFCCCCCC;
  static int colorDDD = 0xFFDDDDDD;
  static int colorEEE = 0xFFEEEEEE;
  static int colorF2F = 0xFFF2F2F2;
  static int colorF7F = 0xFFF7F7F7;
  static int colorFFF = 0xFFFFFFFF;

  static int colorMask = 0xB3000000; /// 遮罩
  static int colorDisable = 0x66FFFFFF; /// 禁用
  static int colorActive = 0x1AEB6101; /// 选中项

  static int colorShadow = 0x0D000000; /// 阴影

  static int colorTRANS = 0x00000000; /// 全透明：黑

  /// 通用色
  static int loadingColor = colorTheme;
  static int defaultBgColor = colorEEE; /// 通用页面背景色

  /// Header
  static int headerBgColor = colorFFF; /// appBar背景颜色
  static int headerHighlightBgColor = colorTheme; /// appBar背景高亮颜色
  static int headerColor = color000; /// appBar默认颜色
  static int headerHighlightColor = colorFFF; /// appBar高亮颜色

  /// Menu
  static int menuBgColor = colorTRANS;
  static int menuItemBgColor = colorFFF;
  static int menuTextColor = color999;
  static int menuTextCurrentColor = colorTheme;
}