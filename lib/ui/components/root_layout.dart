
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/base_fonts.dart';
import 'package:flutter/material.dart';

import 'base_app_bar.dart';


class RootLayout extends StatelessWidget {

  final String? navTitle;
  final Widget child;
  final String? trailingButtonTitle;
  final Function? trailingButtonAction;
  final bool isTransparent;
  final bool isGradient;
  final Color backgroundColor;
  final Color? navBackgroundColor;
  final Color barThemeColor;
  final PreferredSizeWidget? navBottomWidget;
  final BottomNavigationBar? bottomNavBar;

  const RootLayout({
    Key? key,
    this.navTitle,
    required this.child,
    this.trailingButtonTitle,
    this.trailingButtonAction,
    this.isTransparent = false,
    this.isGradient = true,
    this.backgroundColor = BaseColors.grey1,
    this.navBackgroundColor,
    this.barThemeColor = BaseColors.black,
    this.navBottomWidget,
    this.bottomNavBar,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: isTransparent,
        appBar: navTitle == null ? null : BaseAppBar(
          bottomWidget: navBottomWidget,
          elevation: isTransparent ? 0 : 0,
          barThemeColor: isTransparent ? BaseColors.white : barThemeColor,
          pageTitle: navTitle,
          trailing: trailingButtonTitle == null ? const SizedBox() : TextButton(onPressed: () => trailingButtonAction!(), child: Text(trailingButtonTitle!, style: BaseFonts.headline3(color: BaseColors
          .mainColor)
            ,)),
          backgroundColor: navBackgroundColor ?? backgroundColor,
        ),
        body: SafeArea(top: !isTransparent, child: child),
        bottomNavigationBar: bottomNavBar,
    );
  }
}