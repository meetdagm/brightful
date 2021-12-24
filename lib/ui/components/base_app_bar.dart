
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/base_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  /* This App Bar Is Used as the default App Bar in Scaffolds which require an App Bar*/

  @override
  Size get preferredSize => const Size.fromHeight(56);

  final String? pageTitle;
  final String? description;

  final bool hasBackButton;

  final Widget? trailing;
  final Color? backgroundColor;
  final Color? barThemeColor;
  final Widget? backgroundWidget;
  final double? elevation;
  final PreferredSizeWidget? bottomWidget;

  const BaseAppBar({
    Key? key,
    this.pageTitle,
    this.description,
    this.hasBackButton = false,
    this.trailing,
    this.backgroundColor,
    this.barThemeColor,
    this.backgroundWidget,
    this.elevation,
    this.bottomWidget,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottomWidget,
      flexibleSpace: backgroundWidget,
      iconTheme: IconThemeData(color: barThemeColor ?? BaseColors.black),
      actionsIconTheme: const IconThemeData(color: BaseColors.mainColor),
      elevation: elevation ?? 0.65,
      title: Column(
        children: [
          pageTitle != null
              ? Text(
            pageTitle!,
            style: BaseFonts.headline(color: barThemeColor ?? BaseColors.black),
          )
              : const SizedBox(),
          description != null
              ? Text(
            description!,
            style: BaseFonts.footNote(color: BaseColors.grey2),
          )
              : const SizedBox.shrink(),
        ],
      ),
      backgroundColor: backgroundColor ?? BaseColors.white,
      actions: [trailing != null ? trailing! : const SizedBox.shrink()],
    );
  }
}
