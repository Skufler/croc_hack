import 'package:bloc/bloc.dart';
import 'package:croc_hack/src/api/data_provider.dart';
import 'package:croc_hack/src/models/event.dart';

import 'event_selector_event.dart';
import 'event_selector_state.dart';

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
          yield EventSelectorLoading(events: events);
          return;
        }
      } catch (exception) {
        yield EventSelectorError();
      }
    }
    if (event is Clicked) {
      yield EventSelectorClicked();
    }
  }
}
