import 'dart:convert';

import 'package:croc_hack/src/models/character.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class EventAttendingPage extends StatefulWidget {
  final Character character;

  EventAttendingPage({@required this.character}) : assert(character != null);

  @override
  EventAttendingPageState createState() => EventAttendingPageState();
}

class EventAttendingPageState extends State<EventAttendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.character.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.memory(
                  base64Decode(Utils.pic),
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: ListView(shrinkWrap: true, children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'description',
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.33,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.memory(
                              base64Decode(Utils.pic),
                              width: double.infinity,
                              alignment: Alignment.center,
                              fit: BoxFit.fitWidth,
                            ),
                            Text('$index')
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ]),
    ));
  }
}
