import 'package:bloc/bloc.dart';
import 'package:croc_hack/src/api/data_provider.dart';
import 'package:croc_hack/src/blocs/event_selector/event_selector_event.dart';
import 'package:croc_hack/src/blocs/event_selector/event_selector_state.dart';
import 'package:croc_hack/src/models/event.dart';

import 'event_selector_event.dart';

class EventSelectorBloc extends Bloc<EventSelectorEvent, EventSelectorState> {
  @override
  get initialState => EventSelectorUninitialized();
  NetworkDataProvider<Event> _dataProvider =
      new NetworkDataProvider<Event>(fromJson: (json) => Event.fromJson(json));

  @override
  Stream<EventSelectorState> mapEventToState(EventSelectorEvent event) async* {
    if (event is Started) {
      try {
        if (currentState is EventSelectorUninitialized) {
          final events = await _dataProvider.fetchAll();
          yield EventSelectorLoaded(events: events);
          return;
        }
      } catch (_) {
        yield EventSelectorError();
      }
    }
  }
}
