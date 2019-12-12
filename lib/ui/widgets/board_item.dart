import 'package:flutter/material.dart';

class BoardItem extends StatelessWidget
 {
  BoardItem(this._value, this._displayText, this._color, this._callback);
  final int _value;
  final String _displayText;
  final Color _color;
  final VoidCallback _callback;
  final TextStyle _textStyleItem = TextStyle(fontFamily: 'Montserrat',fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.white);
  final TextStyle _textStyle = TextStyle(fontFamily: 'Montserrat',fontSize: 18.0,fontWeight: FontWeight.w200,color: Colors.white);

  @override
  Widget build(BuildContext context) 
  {
    return Card(
      elevation: 15.0,
      color: _color,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(100),
        onTap: _callback,
        child: Container(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Text('$_value',style: _textStyleItem,),
              ),
              Text('$_displayText',style: _textStyle,),
            ],
          ),
        ),
      ),
    );
  }
}
