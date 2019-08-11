import 'package:croc_hack/src/blocs/event_selector/event_selector_bloc.dart';
import 'package:croc_hack/src/blocs/event_selector/event_selector_event.dart';
import 'package:croc_hack/src/blocs/event_selector/event_selector_state.dart';
import 'package:croc_hack/src/models/event.dart';
import 'package:croc_hack/src/widgets/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_info_page.dart';

class EventSelectorPage extends StatefulWidget {
  @override
  EventSelectorPageState createState() => EventSelectorPageState();
}

class EventSelectorPageState extends State<EventSelectorPage> {
  final EventSelectorBloc _bloc = EventSelectorBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.dispatch(Started());

    return Scaffold(
      body: BlocBuilder<EventSelectorBloc, EventSelectorState>(
        bloc: _bloc,
        builder: (BuildContext context, state) {
          if (state is EventSelectorLoading) {
            return Column(children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.events.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Event event = state.events[index];
                    return GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EventInfoPage(id: state.events[index].uuid),
                            ),
                          );
                        },
                        child: EventTile(event: event));
                  }),
            ]);
          }
          if (state is EventSelectorError) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text('Error ocurred'),
                  RaisedButton(
                    child: Text('Try again'),
                    onPressed: () {
                      _bloc.dispatch(Started());
                    },
                  )
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
