import 'package:croc_hack/src/api/json_serializable.dart';

import 'ability.dart';
import 'cosplay_element.dart';

class Character extends JsonSerializable {
  int uuid;
  String name;
  String picture;
  String description;
  List<Ability> abilities;
  List<CosplayElement> cosplayElements;

  Character(
      {this.uuid,
      this.name,
      this.picture,
      this.description,
      this.abilities,
      this.cosplayElements});

  Character.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    picture = json['picture'];
    description = json['description'];
    if (json['abilities'] != null) {
      abilities = new List<Ability>();
      json['abilities'].forEach((v) {
        abilities.add(new Ability.fromJson(v));
      });
    }
    if (json['cosplayelements'] != null) {
      cosplayElements = new List<CosplayElement>();
      json['cosplayelements'].forEach((v) {
        cosplayElements.add(new CosplayElement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['description'] = this.description;
    if (this.abilities != null) {
      data['abilities'] = this.abilities.map((v) => v.toJson()).toList();
    }
    if (this.cosplayElements != null) {
      data['cosplayelements'] =
          this.cosplayElements.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
