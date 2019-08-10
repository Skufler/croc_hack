import 'dart:convert';

import 'package:croc_hack/src/models/event.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class EventTileState extends State<EventTile> {
  Event _event;

  EventTileState(this._event);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Container(
        child: Stack(
          children: <Widget>[
            Image.memory(
              base64Decode(/*_event.picture*/ Utils.pic),
              width: double.infinity,
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
              height: 250,
            ),
            Positioned(
              bottom: 40,
              left: 30,
              child: Text(
                _event.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventTile extends StatefulWidget {
  final Event _event;

  EventTile({Event event}) : this._event = event;

  @override
  EventTileState createState() => EventTileState(_event);
}
