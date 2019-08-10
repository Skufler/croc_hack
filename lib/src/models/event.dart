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
  List<SubEvents> subEvents;
  List<Fights> fights;
  List<Characters> characters;

  Event(
      {this.uuid,
      this.name,
      this.description,
      this.date,
      this.picture,
      this.subEvents,
      this.fights,
      this.characters});

  Event.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
    picture = json['picture'];
    if (json['subevents'] != null) {
      subEvents = new List<SubEvents>();
      json['subevents'].forEach((v) {
        subEvents.add(new SubEvents.fromJson(v));
      });
    }
    if (json['fights'] != null) {
      fights = new List<Fights>();
      json['fights'].forEach((v) {
        fights.add(new Fights.fromJson(v));
      });
    }
    if (json['characters'] != null) {
      characters = new List<Characters>();
      json['characters'].forEach((v) {
        characters.add(new Characters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date'] = this.date;
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
