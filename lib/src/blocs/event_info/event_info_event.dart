// I don't give a fuck
abstract class EventInfoEvent {}

class Attended extends EventInfoEvent {}

class Loading extends EventInfoEvent {}

class Started extends EventInfoEvent {
  final int id;

  Started(this.id);
}
