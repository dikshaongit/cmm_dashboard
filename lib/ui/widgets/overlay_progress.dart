import 'package:flutter/material.dart';

class OverlayProgress extends StatelessWidget
 {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightForFinite(),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.blueGrey,
            ),
          ),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
