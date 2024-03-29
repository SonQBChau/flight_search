

import 'package:flutter/material.dart';

class AirAsiaBar extends StatelessWidget {
  const AirAsiaBar({Key key, this.height}) : super(key:key);

  final double height;


  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
         Container(
          decoration:  BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red, const Color(0xFFE64C85)],
            ),
          ),
          height: height,
        ),
         AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title:  Text(
            "Company",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}