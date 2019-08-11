import 'package:croc_hack/src/models/event.dart';
import 'package:equatable/equatable.dart';

abstract class EventSelectorState extends Equatable {
  EventSelectorState([List props = const []]) : super(props);
}

class EventSelectorUninitialized extends EventSelectorState {
  @override
  String toString() => 'EventSelectorUninitialized';
}

class EventSelectorFetch extends EventSelectorState {
  @override
  String toString() => 'Fetch';
}

class EventSelectorError extends EventSelectorState {
  @override
  String toString() => 'EventSelectorError';
}

class EventSelectorLoading extends EventSelectorState {
  final List<Event> events;

  EventSelectorLoading({
    this.events,
  }) : super([events]);

  EventSelectorLoading copyWith({
    List<Event> events,
  }) {
    return EventSelectorLoading(
      events: events ?? this.events,
    );
  }

  @override
  String toString() => 'EventSelectorLoaded { events: ${events.length} }';
}

class EventSelectorClicked extends EventSelectorState {}
