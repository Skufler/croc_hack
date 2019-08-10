import 'package:bloc/bloc.dart';

import 'event_info_event.dart';
import 'event_info_state.dart';

class EventInfoBloc extends Bloc<EventInfoEvent, EventInfoState> {
  @override
  get initialState => EventInfoState.initial();

  @override
  Stream<EventInfoState> mapEventToState(event) async* {
    switch (event.type) {
      case EventInfoEventType.attend:
        try {
          yield EventInfoState.loading();
        } catch (exception, stacktrace) {
          yield EventInfoState.failed();
        }
        break;
      case EventInfoEventType.attended:
        yield EventInfoState.success();
        break;
    }
  }
}
