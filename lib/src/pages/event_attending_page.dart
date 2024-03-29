import 'dart:convert';

import 'package:croc_hack/src/models/character.dart';
import 'package:flutter/material.dart';

class EventAttendingPage extends StatefulWidget {
  final Character character;

  EventAttendingPage({@required this.character}) : assert(character != null);

  @override
  EventAttendingPageState createState() => EventAttendingPageState();
}

class EventAttendingPageState extends State<EventAttendingPage> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 1));
    // print(c);

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
                  base64Decode(widget.character.picture),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.character.description,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.character.abilities.length,
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
                              base64Decode(
                                  widget.character.abilities[index].picture),
                              width: double.infinity,
                              alignment: Alignment.center,
                              fit: BoxFit.fitWidth,
                            ),
                            Center(
                                child: Text(
                                    widget.character.abilities[index].name))
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
