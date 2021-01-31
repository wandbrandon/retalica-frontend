import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retalica/services/graph_state.dart';
import 'package:tap_builder/tap_builder.dart';

class TimeFrameButton extends StatefulWidget {
  final String text;
  final Function onTap;
  final GraphView view;

  const TimeFrameButton({Key key, this.text, this.onTap, this.view})
      : super(key: key);

  @override
  _TimeFrameButtonState createState() => _TimeFrameButtonState();
}

class _TimeFrameButtonState extends State<TimeFrameButton> {
  bool colorDefiner(bool hovering, bool tapped, GraphView view) {
    if (hovering) {
      return true;
    } else if (tapped) {
      return true;
    } else if (widget.view == view) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final view = context.watch<GraphState>().getView;
    return TapBuilder(
      onTap: widget.onTap,
      builder: (context, TapState tapState) {
        return AnimatedDefaultTextStyle(
          child: Text(widget.text),
          style: TextStyle(
              color: colorDefiner(
                      tapState == TapState.hover, tapState == TapState.pressed, view)
                  ? Theme.of(context).accentColor
                  : Colors.white),
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
  }
}
