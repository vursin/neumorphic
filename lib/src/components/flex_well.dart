import 'package:flutter/material.dart';

// Don't export this, for use only with selection controls
class FlexWell extends StatefulWidget {
  const FlexWell({
    Key? key,
    this.onTap,
    this.text,
    this.padding,
    this.color,
    this.icon,
    this.style,
  }) : super(key: key);
  final void Function()? onTap;
  final String? text;
  final Icon? icon;
  final EdgeInsets? padding;
  final Color? color;
  final TextStyle? style;
  @override
  _FlexWellState createState() => _FlexWellState();
}

class _FlexWellState extends State<FlexWell> {
  static String _toUpperCamelCase(String text) =>
      '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding =
        widget.padding ?? const EdgeInsets.fromLTRB(10, 12, 10, 12);
    Widget child;

    if (widget.text != null) {
      // text is not null or a String representation of null
      child = Text(
        _toUpperCamelCase(widget.text!),
        style: widget.style ??
            const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
      );
    } else {
      child = widget.icon!;
    }

    child = Container(
      padding: padding,
      color: widget.color,
      child: child,
    );

    return Flexible(
      flex: 1,
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: widget.onTap,
        child: child,
      ),
    );
  }
}
