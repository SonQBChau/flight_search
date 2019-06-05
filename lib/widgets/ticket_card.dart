import 'package:flight_search/models/flight_stop_ticket.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final FlightStopTicket stop;

  const TicketCard({Key key, this.stop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(2.0),
      child: _buildCardContent(),
    );
  }

  Container _buildCardContent() {
    TextStyle airportNameStyle =
    new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);
    TextStyle airportShortNameStyle =
    new TextStyle(fontSize: 36.0, fontWeight: FontWeight.w200);
    TextStyle flightNumberStyle =
    new TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500);
    return Container(
      height: 104.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(stop.from, style: airportNameStyle),
                  ),
                  Text(stop.fromShort, style: airportShortNameStyle),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.airplanemode_active,
                  color: Colors.red,
                ),
              ),
              Text(stop.flightNumber, style: flightNumberStyle),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(stop.to, style: airportNameStyle),
                  ),
                  Text(stop.toShort, style: airportShortNameStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}