import 'package:flutter/material.dart';
import 'package:tap_builder/tap_builder.dart';

class StockButton extends StatefulWidget {
  StockButton({Key key}) : super(key: key);

  @override
  _StockButtonState createState() => _StockButtonState();
}

class _StockButtonState extends State<StockButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTapBuilder(
      onTap: () {},
      builder: (context, state, cursorLocation, cursorAlignment) {
        cursorAlignment = state == TapState.hover
            ? Alignment(-cursorAlignment.x, -cursorAlignment.y)
            : Alignment.center;
        return AnimatedContainer(
          
          height: 200,
          width: 300,
          transformAlignment: Alignment.center,
          transform: Matrix4.rotationX(-cursorAlignment.y * 0.2)
            ..rotateY(cursorAlignment.x * 0.2)
            ..scale(
              state == TapState.hover ? 1.07 : 1.0,
            ),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).backgroundColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                AnimatedContainer(
                  height: 200,
                  transformAlignment: Alignment.center,
                  transform: Matrix4.translationValues(
                    cursorAlignment.x * 3,
                    cursorAlignment.y * 3,
                    0,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: Center(
                    child: Text(
                      'AnimatedTapBuilder',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    alignment:
                        Alignment(-cursorAlignment.x, -cursorAlignment.y),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.01),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(
                                state == TapState.hover ? 0.5 : 0.0),
                            blurRadius: 200,
                            spreadRadius: 130,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}