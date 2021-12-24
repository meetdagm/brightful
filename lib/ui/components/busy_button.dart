
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/base_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BusyButton extends StatefulWidget {

  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  final double padding;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const BusyButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.busy = false,
    this.padding = 8.0,
    this.height = 65,
    this.backgroundColor = BaseColors.black,
    this.textColor = BaseColors.white,
    this.enabled = true
  }): super(key: key);

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: GestureDetector(
        onTap: () => widget.onPressed(),
        child: SizedBox(
          height: widget.height,
          child: InkWell(
            child: AnimatedContainer(
              height: widget.busy ? 40 : 0,
              // width: widget.busy ? 40 : null,
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: widget.busy ? 10 : 15,
                  vertical: widget.busy ? 10 : 10),
              decoration: BoxDecoration(
                color: widget.enabled ? widget.backgroundColor : Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: !widget.busy
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: AutoSizeText(
                  widget.title,
                  style: BaseFonts.headline(color: widget.textColor),
                ),
              )
                  : const CupertinoActivityIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
