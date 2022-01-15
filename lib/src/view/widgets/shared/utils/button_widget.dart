import 'package:flutter/material.dart';

class ButtomWidget extends StatefulWidget {
  const ButtomWidget(
      {Key? key,
      this.stream,
      required this.function,
      required this.text,
      required this.enebleColor,
      required this.disableColor,
      this.heroTag})
      : super(key: key);

  final Stream? stream;
  final function;
  final String text;
  final Color enebleColor;
  final Color disableColor;
  final heroTag;

  @override
  State<ButtomWidget> createState() => _ButtomWidgetState();
}

class _ButtomWidgetState extends State<ButtomWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FloatingActionButton.extended(
          heroTag: widget.heroTag,
          backgroundColor: widget.stream == null
              ? widget.enebleColor
              : snapshot.hasData
                  ? widget.enebleColor
                  : widget.disableColor,
          onPressed: widget.stream == null
              ? widget.function
              : snapshot.hasData
                  ? widget.function
                  : null,
          label: Text(widget.text),
        );
      },
    );
  }
}
