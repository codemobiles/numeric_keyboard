library numeric_keyboard;

import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Color of the button [default = Colors.transparent]
  final Color? buttonBackgroundColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  final double? numberFontSize;
  final double? numberFontWidth;
  final double? numberFontHeight;
  final double? borderRadius;

  NumericKeyboard({Key? key,
    required this.onKeyboardTap,
    this.textColor = Colors.black,
    this.buttonBackgroundColor = const Color(0xFFF5F5F5),
    this.rightButtonFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
    this.borderRadius = 80,
    this.numberFontSize = 26,
    this.numberFontHeight = 70,
    this.numberFontWidth = 70,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            buttonPadding: EdgeInsets.all(3),
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            buttonPadding: EdgeInsets.all(3),
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            buttonPadding: EdgeInsets.all(3),
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            buttonPadding: EdgeInsets.all(3),
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              Material(
                color: widget.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius!),
                child: InkWell(
                    borderRadius: BorderRadius.circular(widget.borderRadius!),
                    onTap: widget.leftButtonFn,
                    child: Container(alignment: Alignment.center, width: widget.numberFontWidth, height: widget.numberFontHeight, child: Text(
                      'C',
                      style: TextStyle(fontSize: widget.numberFontSize, fontWeight: FontWeight.bold, color: widget.textColor),
                    ),)),
              ),
              _calcButton('0'),
              Material(
                color: widget.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius!),
                child: InkWell(
                    borderRadius: BorderRadius.circular(widget.borderRadius!),
                    onTap: widget.rightButtonFn,
                    child: Container(alignment: Alignment.center, width: widget.numberFontWidth, height: widget.numberFontHeight, child: widget.rightIcon)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Material(
          color: widget.buttonBackgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          child: InkWell(
              borderRadius: BorderRadius.circular(widget.borderRadius!),
              onTap: () {
                widget.onKeyboardTap(value);
              },
              child: Container(
                alignment: Alignment.center,
                width: widget.numberFontWidth,
                height: widget.numberFontHeight,
                child: Text(
                  value,
                  style: TextStyle(fontSize: widget.numberFontSize, fontWeight: FontWeight.bold, color: widget.textColor),
                ),
              ))
      ),
    );
  }
}
