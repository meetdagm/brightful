
import 'package:brightful/ui/shared/base_color.dart';
import 'package:flutter/material.dart';
import 'busy_button.dart';


class BottomButtonLayout extends StatelessWidget {

  final Widget child;
  @protected final String title;
  @protected final Function action;
  @protected final bool busy;
  @protected final bool enabled;
  @protected final Color color;
  @protected final Color textColor;

  const BottomButtonLayout({
    Key? key,
    required this.child,
    required this.title,
    required this.action,
    this.busy = false,
    this.enabled = true,
    this.color = BaseColors.mainColor,
    this.textColor = BaseColors.white,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // fit: StackFit.expand,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: child),
        Padding(
          padding: const EdgeInsets.only(bottom: 7.0, left: 8, right: 8),
          child: BusyButton(
            backgroundColor: color,
            padding: 3,
            enabled: enabled,
            busy: busy,
            title: title,
            onPressed: action,
            textColor: textColor,
            // padding: EdgeInsets.only(left: 7.0, bottom: 7.0, right: 7.0),
          ),
        )
      ],
    );
  }
}
