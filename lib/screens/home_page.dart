

import 'package:flight_search/screens/rounded_button.dart';
import 'package:flight_search/widgets/air_asia_bar.dart';
import 'package:flight_search/widgets/button_row.dart';
import 'package:flight_search/widgets/content_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AirAsiaBar(height: 210.0),
          Column(
            children: <Widget>[
              ButtonRow(),
              Expanded(child: ContentCard()),
            ],
          ),

        ],
      ),
    );
  }
}




