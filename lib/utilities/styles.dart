import 'package:flutter/material.dart';

const BUTTON_TYPE_RECT = 2.0;
const BUTTON_TYPE_ROUND = 30.0;

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(30.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.white, // background
  onPrimary: Colors.white, // foreground
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
);

ElevatedButton elevatedButton(
    String _text, Color _colorText, Color _colorButton, double _type) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: _colorButton, // background
      onPrimary: _colorButton, // foreground
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_type),
      ),
    ),
    onPressed: () {},
    child: Text(
      _text,
      style: TextStyle(
        color: _colorText,
        letterSpacing: 1.5,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),
    ),
  );
}
