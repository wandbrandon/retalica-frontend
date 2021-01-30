import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_builder/tap_builder.dart';

class AppBarAction extends StatelessWidget {
  final String route;

  const AppBarAction({Key key, this.route}) : super(key: key);

  bool colorDefiner(bool hovering, bool tapped, String currentRoute) {
    if (hovering) {
      return true;
    } else if (tapped) {
      return true;
    } else if (route == currentRoute) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, right: 23.0 ),
      child: TapBuilder(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        builder: (BuildContext context, TapState tapState) {
          return AnimatedDefaultTextStyle(
            child: route!='/' ? Text(route) : Text('/home'),
            style: TextStyle(
                color: colorDefiner(
                        tapState == TapState.hover,
                        tapState == TapState.pressed,
                        ModalRoute.of(context).settings.name)
                    ? Theme.of(context).accentColor
                    : Colors.white),
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
