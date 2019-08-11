import 'package:croc_hack/src/pages/event_attending_page.dart';
import 'package:croc_hack/src/pages/event_selector_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/event_selector/event_selector_bloc.dart';
import 'pages/event_info_page.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<EventSelectorBloc>(
            builder: (context) => EventSelectorBloc(),
            child: EventSelectorPage()),
        routes: {
          '/selector': (BuildContext context) => EventSelectorPage(),
          '/info': (BuildContext context) => EventInfoPage(
                id: null,
              ),
          '/attend': (BuildContext context) =>
              EventAttendingPage(character: null)
        });
  }
}
