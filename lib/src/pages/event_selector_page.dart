import 'package:croc_hack/src/blocs/event_selector/event_selector_bloc.dart';
import 'package:croc_hack/src/blocs/event_selector/event_selector_event.dart';
import 'package:croc_hack/src/blocs/event_selector/event_selector_state.dart';
import 'package:croc_hack/src/models/event.dart';
import 'package:croc_hack/src/widgets/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventSelectorPage extends StatefulWidget {
  @override
  EventSelectorPageState createState() => EventSelectorPageState();
}

class EventSelectorPageState extends State<EventSelectorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final EventSelectorBloc _bloc = BlocProvider.of<EventSelectorBloc>(context);
    _bloc.dispatch(Started());
    return Scaffold(
      body: BlocBuilder<EventSelectorBloc, EventSelectorState>(
        builder: (BuildContext context, state) {
          if (state is EventSelectorLoaded) {
            return Column(children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.events.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Event event = state.events[index];
                    return EventTile(event: event);
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
}
