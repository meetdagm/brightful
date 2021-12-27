import 'package:flutter/material.dart';

/*

This Widget holds it's children in a list so everything can be easily displayed on any screen, if the keyboard pops up or the screen is not big enough it will just turn its children into a
scrollable list and rearranges the screen size so nothing is cut out.
*/

class SelfSizingListView extends StatelessWidget {

  final List<Widget> children;
  final EdgeInsets padding;

  const SelfSizingListView({
    Key? key,
    required this.children,
    this.padding = EdgeInsets.zero
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ListView(
          shrinkWrap: true,
          primary: true,
          children: children
      ),
    );
  }

}
