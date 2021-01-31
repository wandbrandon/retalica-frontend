import 'package:flutter/material.dart';
import 'package:retalica/models/stock_model.dart';
import 'package:retalica/stock_info/widgets/stock_line_mini.dart';
import 'package:retalica/stock_info/widgets/stock_page.dart';
import 'package:tap_builder/tap_builder.dart';

class StockButton extends StatefulWidget {
  final Stock stock;

  StockButton({Key key, this.stock}) : super(key: key);

  @override
  _StockButtonState createState() => _StockButtonState();
}

class _StockButtonState extends State<StockButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTapBuilder(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => StockPage(stock: widget.stock)));
      },
      builder: (context, state, cursorLocation, cursorAlignment) {
        cursorAlignment = state == TapState.hover
            ? Alignment(cursorAlignment.x, cursorAlignment.y)
            : Alignment.center;
        return AnimatedContainer(
          transformAlignment: Alignment.center,
          transform: Matrix4.rotationX(-cursorAlignment.y * 0.2)
            ..rotateY(cursorAlignment.x * 0.2)
            ..scale(
              state == TapState.hover ? .96 : 1.0,
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
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: AnimatedContainer(
                    transformAlignment: Alignment.center,
                    transform: Matrix4.translationValues(
                      cursorAlignment.x * 5,
                      cursorAlignment.y * 5,
                      0,
                    ),
                    duration: const Duration(milliseconds: 200),
                    child: Center(
                      child: Text(
                        '${widget.stock.ticker}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                    transformAlignment: Alignment.center,
                    transform: Matrix4.translationValues(
                      cursorAlignment.x * 10,
                      cursorAlignment.y * 10,
                      0,
                    ),
                    padding: const EdgeInsets.only(right: 32, left: 32, top:80, bottom:50),
                    duration: const Duration(milliseconds: 200),
                    child: Center(
                      child: StockLineMini(stock: widget.stock)
                    ),
                  ),
                Positioned.fill(
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    alignment:
                        Alignment(cursorAlignment.x, cursorAlignment.y),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.01),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(
                                state == TapState.hover ? 0.2 : 0.0),
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
