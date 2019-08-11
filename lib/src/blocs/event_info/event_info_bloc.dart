import 'package:bloc/bloc.dart';
import 'package:croc_hack/src/api/data_provider.dart';
import 'package:croc_hack/src/models/event.dart';

import 'event_info_event.dart';
import 'event_info_state.dart';

class EventInfoBloc extends Bloc<EventInfoEvent, EventInfoState> {
  @override
  get initialState => EventInfoUninitialized();
  NetworkDataProvider<Event> _dataProvider =
      new NetworkDataProvider<Event>(fromJson: (json) => Event.fromJson(json));

  @override
  Stream<EventInfoState> mapEventToState(event) async* {
    if (event is Started) {
      try {
        if (currentState is EventInfoUninitialized) {
          final data = await _dataProvider.fetchById(event.id);
          yield EventInfoLoaded(event: data);
          return;
        }
      } catch (exception) {
        yield EventInfoError();
      }
    }
  }
}
