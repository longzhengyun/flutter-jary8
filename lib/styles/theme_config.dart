class ThemeConfig {
  /// 通用色
  static int colorTheme = 0xFF6175FF; /// 主色调: 蓝色
  static int color1 = 0xFFFF616B; /// 色调1: 红色
  static int color2 = 0xB3FFFFFF; /// 色调2: 70%透明度白
  static int color3 = 0x66FFFFFF; /// 色调3: 40%透明度白
  static int color4 = 0x666175FF; /// 色调4: 40%透明蓝色
  static int color5 = 0x1AFF616B; /// 色调5: 浅红色
  static int color6 = 0x1A6175FF; /// 色调6: 浅蓝色
  static int color7 = 0xFF2CA9E1; /// 色调7: 蓝色
  static int color8 = 0xFFFFF2EC; //// 色调8: 淡橙色
  static int color9 = 0xFFEFF9F6; /// 色调9: 浅绿色

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
  static int defaultBgColor = colorFFF; /// 通用页面背景色
  static int defaultMaskBgColor = colorTRANS; /// 通用遮罩背景色
  static int defaultShadowColor = colorShadow; /// 通用阴影

  /// 通用icon
  static String appIcon = 'assets/images/icon_app.png'; /// app icon
  static String userDefaultIcon = 'assets/images/user_default.png'; /// 用户默认头像
  static String moreIcon = 'assets/images/icon_more.png'; /// 更多icon
  static String hintIcon = 'assets/images/icon_hint.png'; /// 提示icon
  static String hintIcon2 = 'assets/images/icon_hint2.png'; /// 提示icon
  static String selectIcon = 'assets/images/icon_select.png'; /// 未选中icon
  static String selectedIcon = 'assets/images/icon_selected.png'; /// 已选中icon
  static String selectIcon2 = 'assets/images/icon_select2.png'; /// 未选中icon
  static String selectedIcon2 = 'assets/images/icon_selected2.png'; /// 已选中icon
  static String plusIcon = 'assets/images/icon_plus.png'; /// 加icon
  static String lessIcon = 'assets/images/icon_less.png'; /// 减icon

  /// 底部菜单
  static int bottomBarBgColor = colorTRANS;
  static int bottomBarItemBgColor = colorFFF;
  static int bottomBarTextColor = color999;
  static int bottomBarTextCurrentColor = colorTheme;
  static List<Map> bottomBarIcon = [
    { 'icon': 'assets/images/icon_home.png', 'iconCurrent': 'assets/images/icon_home_current.png', },
    { 'icon': 'assets/images/icon_auth.png', 'iconCurrent': 'assets/images/icon_auth_current.png', },
    { 'icon': 'assets/images/icon_repay.png', 'iconCurrent': 'assets/images/icon_repay_current.png', },
  ];

  /// 通用btn
  static int defaultBtnTextColor = colorFFF; /// 通用按钮文本颜色
  static int defaultBtnTextColor2 = colorTheme; /// 通用按钮文本颜色
  static int defaultBtnDisableTextColor = color4; /// 通用按钮禁用文本颜色
  static int defaultBorderColor = colorTheme; /// 通用按钮边框颜色
  static int defaultBorderBgColor = colorFFF; /// 通用按钮边框文本颜色
  static int defaultBtnBgColor = colorTheme; /// 通用按钮背景颜色
  static int defaultBtnBgColor2 = colorFFF; /// 通用按钮背景颜色
  static int defaultBtnDisableBgColor = colorDisable; /// 通用按钮禁用背景颜色

  /// 通用appBar
  static String defaultBarActionIcon1 = 'assets/images/icon_bar_mine.png'; /// 我的 icon
  static String defaultBarActionIcon2 = 'assets/images/icon_bar_feedback.png'; /// 意见反馈 icon
  static int defaultBarBgColor = colorFFF; /// appBar背景颜色
  static int defaultBarHighlightBgColor = colorTheme; /// appBar背景高亮颜色
  static int defaultBarColor = color000; /// appBar默认颜色
  static int defaultBarHighlightColor = colorFFF; /// appBar高亮颜色

  /// tab组件
  static int tabBorderColor = colorEEE; /// tab边框颜色
  static int tabTextColor = color999; /// tab默认文本颜色
  static int tabTextCurrentColor = colorTheme; /// tab选中文本颜色
  static int tabLineColor = colorTheme; /// tab选中横线颜色

  /// form组件
  static String formArrowIcon = 'assets/images/icon_more.png'; /// 表格箭头icon
  static String formArrowIcon2 = 'assets/images/icon_more2.png'; /// 表格箭头icon
  static String formArrowIcon3 = 'assets/images/icon_more5.png'; /// 表格箭头icon
  static int formNameColor = color666; /// 表格名颜色
  static int formValueColor = color333; /// 表格值颜色
  static int formBorderColor = colorEEE; /// 表格边框颜色

  /// 上传图片组件
  static String uploadImageIcon1 = 'assets/images/icon_upload1.png'; /// 上传图片
  static String uploadImageIcon2 = 'assets/images/icon_upload2.png'; /// 活体检测
  static String uploadImageIcon3 = 'assets/images/icon_upload3.png'; /// 身份证正面
  static String uploadImageBgIcon1 = 'assets/images/bg_upload1.png'; /// 上传身份证背景图
  static String uploadImageBgIcon2 = 'assets/images/bg_upload2.png'; /// 活体检测背景图
  static String uploadImageBgIcon3 = 'assets/images/bg_upload3.png'; /// 工作证背景图
  static int uploadImageTextColor = colorF2F; /// 上传图片文本颜色

  /// dialog组件
  static int dialogBgColor = colorFFF;
  static int dialogBorderColor = colorEEE;
  static int dialogTitleColor = color333;
  static int dialogTextColor = color666;
  static int dialogValueColor = color333;
  static int dialogSelectedColor = colorTheme;

  ///暂无数据组件
  static String nothingIcon = 'assets/images/icon_nothing.png';
  static int nothingTextColor = color666;

  /// 登录组件
  static String loginPhoneIcon = 'assets/images/icon_login_phone.png';
  static String loginPhoneIcon2 = 'assets/images/icon_login_phone2.png';
  static String loginCodeIcon = 'assets/images/icon_login_code.png';
  static String loginPasswordIcon = 'assets/images/icon_login_password.png';
  static String loginPasswordHideIcon = 'assets/images/icon_login_hide.png';
  static String loginPasswordShowIcon = 'assets/images/icon_login_show.png';
  static int loginTitleColor = colorFFF; /// 登录页标题颜色
  static int loginFormValueColor = color2; /// 表单值颜色
  static int loginFormBorderColor = color3; /// 表单边框颜色

  /// 首页组件
  static String homeFastLoanBgIcon = 'assets/images/bg_fast_loan.png';
  static String homeFastLoanIcon = 'assets/images/icon_fast_loan.png';

  /// 一键下单
  static String fastLoanMoreIcon = 'assets/images/icon_more6.png';
  static String fastLoanMoreIcon2 = 'assets/images/icon_more7.png';
  static String fastLoanStateIcon1 = 'assets/images/icon_fast_loan.png';
  static String fastLoanStateIcon2 = 'assets/images/icon_fast_fail.png';
  static int fastLoanStateBgColor = colorEEE;
  static int fastLoanStateTitleColor = color333;
  static int fastLoanStateTextColor = color999;
  static int fastLoanTitleColor = color333;
  static int fastLoanTextColor = color999;

  /// 认证页组件
  static String authOptionIcon1 = 'assets/images/icon_auth1.png';
  static String authOptionIcon2 = 'assets/images/icon_auth2.png';
  static String authOptionIcon3 = 'assets/images/icon_auth3.png';
  static String authOptionIcon4 = 'assets/images/icon_auth4.png';
  static String authStepIcon1 = 'assets/images/icon_step1.png';
  static String authStepIcon2 = 'assets/images/icon_step2.png';
  static String authStepIcon3 = 'assets/images/icon_step2_current.png';
  static int authOptionTitleColor = color333;
  static int authOptionTextColor = color999;
  static int authOptionHintColor = color4;
  static int authOptionHintBgColor = color6;
  static int authOptionStateColor = colorFFF;
  static int authOptionStateBgColor = colorTheme;
  static int authStepColor = color333;
  static int authStepCurrentColor = colorTheme;
  static int authStepBgColor = colorF2F;
  static int authStepLineColor = colorTheme;
  static int authTextColor1 = colorTheme;
  static int authTextColor2 = color999;
  static int authBaseBgColor = colorF7F;
  static int authContactBgColor = colorFFF;

  /// 我的页组件
  static String mineUserInfoIcon = 'assets/images/icon_user_info.png';
  static String mineOptionMoreIcon = 'assets/images/icon_more4.png';
  static String mineOptionMoreIcon2 = 'assets/images/icon_more.png';
  static String mineOptionIcon1 = 'assets/images/icon_order.png';
  static String mineOptionIcon2 = 'assets/images/icon_help.png';
  static String mineOptionIcon3 = 'assets/images/icon_feedback.png';
  static String mineOptionIcon4 = 'assets/images/icon_set.png';
  static String mineOptionIcon5 = 'assets/images/icon_aboutus.png';
  static String mineOptionIcon6 = 'assets/images/icon_private.png';
  static String mineOptionIcon7 = 'assets/images/icon_update.png';
  static int mineUserInfoTitleColor = color333;
  static int mineUserInfoTextColor = color999;
  static int mineUserInfoBorderColor = colorTheme;
  static int mineOptionTitleColor = color333;
  static int mineAppInfoTextColor = color333;

  /// 隐私确认页
  static int privacySelectBgColor = colorF2F;
  static int privacySelectHintColor = color1;
  static int privacySelectTextColor = color999;

  /// faq组件
  static String faqQuestionIcon = 'assets/images/icon_question.png';
  static String faqAnswerIcon = 'assets/images/icon_answer.png';
  static int faqQuestionColor = color333;
  static int faqAnswerColor = color666;

  /// 意见反馈组件
  static String feedbackBarActionIcon = 'assets/images/icon_edit.png';
  static int feedbackItemBgColor = colorFFF;
  static int feedbackPicBgColor = colorF2F;
  static int feedbackItemContentColor = color333;
  static int feedbackItemTextColor = color999;
  static int feedbackItemReplyBgColor = colorEEE;

  /// 订单组件
  static String orderRepayMoreIcon = 'assets/images/icon_more4.png';
  static String orderRepayBgIcon = 'assets/images/bg_repay.png';
  static String orderItemBgIcon = 'assets/images/bg_list_item.png';
  static String orderStateIcon1 = 'assets/images/icon_order_state1.png';
  static String orderStateIcon2 = 'assets/images/icon_order_state2.png';
  static String orderStateIcon3 = 'assets/images/icon_order_state3.png';
  static String orderStateIcon4 = 'assets/images/icon_order_state4.png';
  static String orderStateIcon5 = 'assets/images/icon_order_state5.png';
  static String orderStateIcon6 = 'assets/images/icon_order_state6.png';
  static int orderItemNameColor = color666;
  static int orderItemValueColor = color333;
  static int orderItemHintColor = color1;
  static int orderItemHintBgColor = color5;
  static int orderItemHintColor2 = color999;
  static int orderItemHintBgColor2 = colorEEE;
  static int orderStateBgColor = colorEEE;
  static int orderStateTitleColor = color333;
  static int orderStateTextColor = color999;
  static int orderOverdueColor = color1;
  static int orderDetailTitleColor = color333;
  static int orderDetailTextColor = color999;
  static int orderRepayTextColor = color999;
  static int orderRepayValueColor = color333;
  static int orderRepayBtnColor = colorTheme;
  static int orderRepayCountColor = colorFFF;
  static int orderRepayCountTextColor = color2;
  static int orderRepayLineColor = color3;

  /// 产品组件
  static String productItemBgIcon = 'assets/images/bg_list_item.png';
  static String productItemBgIcon2 = 'assets/images/bg_product_info.png';
  static String productItemIcon1 = 'assets/images/icon_ksp.png';
  static String productItemIcon2 = 'assets/images/icon_ojk.png';
  static String productItemIcon3 = 'assets/images/icon_term.png';
  static String productItemIcon4 = 'assets/images/icon_rate.png';
  static String productCheckIcon = 'assets/images/icon_product_check.png';
  static String productdetailInfoIcon = 'assets/images/bg_detail.png';
  static String productdetailIcon1 = 'assets/images/icon_detail_step1.png';
  static String productdetailIcon2 = 'assets/images/icon_detail_step2.png';
  static String productdetailIcon3 = 'assets/images/icon_detail_step3.png';
  static String productdetailIcon4 = 'assets/images/icon_detail_step4.png';
  static String productdetailIcon5 = 'assets/images/icon_detail_option1.png';
  static String productdetailIcon6 = 'assets/images/icon_detail_option2.png';
  static String productdetailIcon7 = 'assets/images/icon_detail_option3.png';
  static String productdetailIcon8 = 'assets/images/icon_detail_option4.png';
  static int productItemNameColor = color666;
  static int productItemValueColor = color333;
  static int productItemTextColor = color999;
  static int productDetailBgColor = colorF7F;
  static int productDetailInfoColor = colorFFF;
  static int productDetailTextColor = colorTheme;
  static int productDetailTextColor2 = color3;
  static int productConfirmTextColor = color1;
  static int productConfirmTextColor2 = color999;
  static int productConfirmBgColor = colorF7F;
  static int productDownloadColor = colorTheme;
  static int productDownloadBgColor = colorF7F;
}