class ThemeConfig {
  /// 通用色
  static int colorTheme = 0xFFCC0000; /// 主色调: 红色

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
  static int loadingColor = colorTheme; /// 通用loading色
  static int defaultTextColor = color333; /// 通用页面文本色
  static int defaultBgColor = colorFFF; /// 通用模块背景色
  static int defaultPageBgColor = colorEEE; /// 通用页面背景色
  static int defaultBorderColor = colorDDD; /// 通用边框色

  /// Header
  static int headerTextColor = color000;
  static int headerHighlightColor = colorFFF;
  static int headerHighlightBgColor = colorTheme;

  /// Menu
  static int menuBgColor = colorTRANS;
  static int menuTextColor = color999;
  static int menuTextCurrentColor = colorTheme;

  /// Home
  static String homeLoginIcon = 'assets/images/logo.png';
  static int homeSearchTextColor = color999;
  static int homeSearchBtnBgColor = colorEEE;
  static int homeListBtnColor = color999;

  /// Detail
  static int detailInfoTextColor = color999;
}