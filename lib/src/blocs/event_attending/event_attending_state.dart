import 'package:croc_hack/src/models/character.dart';
import 'package:equatable/equatable.dart';

abstract class EventAttendingState extends Equatable {
  EventAttendingState([List props = const []]) : super(props);
}

class EventAttendingUninitialized extends EventAttendingState {
  @override
  String toString() => 'EventAttendingUninitialized';
}

class EventAttendingError extends EventAttendingState {
  @override
  String toString() => 'EventAttendingError';
}

class EventAttendingLoaded extends EventAttendingState {
  final Character character;

  EventAttendingLoaded({
    this.character,
  }) : super([character]);

  @override
  String toString() => 'EventAttendingLoaded { character: $character }';
}
