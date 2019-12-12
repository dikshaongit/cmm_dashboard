import 'package:flutter/material.dart';

class AppButton extends StatelessWidget 
{
  AppButton(this._label, this._onPressed);
  final String _label;
  final VoidCallback _onPressed;

  final TextStyle textStyle = TextStyle(fontFamily: 'Montserrat',fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold);
  Widget build(BuildContext context) {
    return new Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _onPressed,
        child: Text(
          _label,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}
