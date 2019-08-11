import 'dart:convert';

import 'package:croc_hack/src/api/data_provider.dart';
import 'package:croc_hack/src/blocs/event_info/event_info_bloc.dart';
import 'package:croc_hack/src/blocs/event_info/event_info_event.dart';
import 'package:croc_hack/src/blocs/event_info/event_info_state.dart';
import 'package:croc_hack/src/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_attending_page.dart';

class EventInfoPage extends StatefulWidget {
  final int id;

  EventInfoPage({@required this.id});

  @override
  EventInfoPageState createState() => EventInfoPageState();
}

class EventInfoPageState extends State<EventInfoPage> {
  final EventInfoBloc _bloc = EventInfoBloc();

  TextStyle _bigTextStyle =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 32);

  @override
  Widget build(BuildContext context) {
    _bloc.dispatch(Started(widget.id));

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFF5F5F5),
      body: BlocBuilder<EventInfoBloc, EventInfoState>(
          bloc: _bloc,
          builder: (BuildContext context, state) {
            if (state is EventInfoLoaded) {
              return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(state.event.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              )),
                          background: Image.memory(
                            base64Decode(state.event.picture),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ];
                },
                body: ListView(shrinkWrap: true, children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Where?',
                          textAlign: TextAlign.left,
                          style: _bigTextStyle,
                        ),
                      ),
                      buildEventInfo(state),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Who?',
                          textAlign: TextAlign.left,
                          style: _bigTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: _buildCharactersRow(state),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'What?',
                          textAlign: TextAlign.left,
                          style: _bigTextStyle,
                        ),
                      ),
                      _buildCarousel(context, state),
                      Center(
                        child: Container(
                          width: 150,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              'Start fighting!',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              );
            }

            if (state is EventInfoError) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Text('Error ocurred'),
                    RaisedButton(
                      child: Text('Try again'),
                      onPressed: () {
                        _bloc.dispatch(Started(widget.id));
                      },
                    )
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Container buildEventInfo(EventInfoLoaded state) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.access_time),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                    ),
                    Text(state.event.date)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.location_on),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                    ),
                    Text(state.event.location)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final provider = new NetworkDataProvider<Character>(
      fromJson: (json) => Character.fromJson(json));

  Widget _buildCharactersRow(EventInfoLoaded state) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5.0, mainAxisSpacing: 5.0),
        itemCount: state.event.characters.length,
        itemBuilder: (BuildContext context, int index) {
          return ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    var character = await provider
                        .fetchById(state.event.characters[index].uuid);

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EventAttendingPage(character: character),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.memory(
                        base64Decode(state.event.characters[index].picture),
                        fit: BoxFit.fitWidth,
                        height: 150,
                        width: 200,
                      ),
                      Positioned(
                          bottom: 40,
                          child: Text(
                            state.event.characters[index].name,
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          )),
                    ],
                  ),
                ),
              ]);
        });
  }

  Widget _buildCarousel(BuildContext context, EventInfoLoaded state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 200.0,
          child: PageView.builder(
            itemCount: state.event.subEvents.length,
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, itemIndex, state);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int itemIndex, EventInfoLoaded state) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Card(
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
                  base64Decode(state.event.subEvents[itemIndex].picture),
                  width: double.infinity,
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  height: 250,
                ),
                Positioned(
                  bottom: 40,
                  left: 30,
                  child: Text(
                    state.event.subEvents[itemIndex].name,
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
        ));
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
