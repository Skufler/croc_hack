import 'package:croc_hack/src/models/event.dart';
import 'package:equatable/equatable.dart';

abstract class EventInfoState extends Equatable {
  EventInfoState([List props = const []]) : super(props);
}

class EventInfoUninitialized extends EventInfoState {
  @override
  String toString() => 'EventInfoUninitialized';
}

class EventInfoError extends EventInfoState {
  @override
  String toString() => 'EventInfoError';
}

class EventInfoLoaded extends EventInfoState {
  final Event event;

  EventInfoLoaded({
    this.event,
  }) : super([event]);

  @override
  String toString() => 'EventInfoLoaded { event: $event }';
}
