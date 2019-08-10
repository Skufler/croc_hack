import 'package:croc_hack/src/pages/event_selector_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/event_selector/event_selector_bloc.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<EventSelectorBloc>(
            builder: (context) => EventSelectorBloc(),
            child: EventSelectorPage()));
  }
}
