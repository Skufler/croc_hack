// I don't give a fuck
enum EventInfoEventType { attend, attended }

class EventInfoEvent {
  final EventInfoEventType type;

  EventInfoEvent({this.type: EventInfoEventType.attend}) : assert(type != null);
}
