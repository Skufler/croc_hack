import 'package:croc_hack/src/api/json_serializable.dart';
import 'package:croc_hack/src/models/sub_event.dart';

import 'character.dart';
import 'fight.dart';

class Event extends JsonSerializable {
  int uuid;
  String name;
  String description;
  String date;
  String picture;
  String location;
  List<SubEvent> subEvents;
  List<Fight> fights;
  List<Character> characters;

  Event(
      {this.uuid,
      this.name,
      this.description,
      this.date,
      this.picture,
      this.location,
      this.subEvents,
      this.fights,
      this.characters});

  Event.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
    picture = json['picture'];
    location = json['location'];
    if (json['subevents'] != null) {
      subEvents = new List<SubEvent>();
      json['subevents'].forEach((v) {
        subEvents.add(new SubEvent.fromJson(v));
      });
    }
    if (json['fights'] != null) {
      fights = new List<Fight>();
      json['fights'].forEach((v) {
        fights.add(new Fight.fromJson(v));
      });
    }
    if (json['characters'] != null) {
      characters = new List<Character>();
      json['characters'].forEach((v) {
        characters.add(new Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date'] = this.date;
    data['location'] = this.location;
    data['picture'] = this.picture;
    if (this.subEvents != null) {
      data['subevents'] = this.subEvents.map((v) => v.toJson()).toList();
    }
    if (this.fights != null) {
      data['fights'] = this.fights.map((v) => v.toJson()).toList();
    }
    if (this.characters != null) {
      data['characters'] = this.characters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
