
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
  final Color navBackgroundColor;
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
    this.navBackgroundColor = BaseColors.grey1,
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
          backgroundColor: isTransparent ? Colors.transparent: navBackgroundColor,
          backgroundWidget: !isTransparent ? null : Container(
            decoration: BoxDecoration(
              color: Colors.red,
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.01),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.98),
                    Colors.black.withOpacity(0.98),
                    Colors.black.withOpacity(0.98),
                    Colors.black,
                    Colors.black,
                    Colors.black,
                  ]
              ),
            ),
          ),
        ),
        body: SafeArea(top: !isTransparent, child: child),
        bottomNavigationBar: bottomNavBar,
    );
  }
}