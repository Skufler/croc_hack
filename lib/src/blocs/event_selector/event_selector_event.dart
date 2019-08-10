//enum EventSelectorEventType { start, loaded }
//
//class EventSelectorEvent {
//  final EventSelectorEventType type;
//
//  EventSelectorEvent({this.type: EventSelectorEventType.start})
//      : assert(type != null);
//}switch
//
abstract class EventSelectorEvent {}

class Loading extends EventSelectorEvent {}

class Started extends EventSelectorEvent {}
