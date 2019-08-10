//class EventSelectorState {
//  bool isLoading;
//  bool isSuccess;
//  bool isFailed;
//
//  EventSelectorState(
//      {this.isLoading = false, this.isSuccess = false, this.isFailed = false});
//
//  factory EventSelectorState.initial() {
//    return EventSelectorState();
//  }
//
//  factory EventSelectorState.loading() {
//    return EventSelectorState(isLoading: true);
//  }
//
//  factory EventSelectorState.failed() {
//    return EventSelectorState(isFailed: true, isLoading: false);
//  }
//
//  factory EventSelectorState.success() {
//    return EventSelectorState(isSuccess: true, isLoading: false);
//  }
//}
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

class EventSelectorLoaded extends EventSelectorState {
  final List<Event> events;

  EventSelectorLoaded({
    this.events,
  }) : super([events]);

  EventSelectorLoaded copyWith({
    List<Event> posts,
    bool hasReachedMax,
  }) {
    return EventSelectorLoaded(
      events: posts ?? this.events,
    );
  }

  @override
  String toString() => 'EventSelectorLoaded { events: ${events.length} }';
}
