import 'abilities.dart';
import 'cosplayelements.dart';

class Characters {
  int uuid;
  String name;
  String picture;
  String description;
  List<Abilities> abilities;
  List<CosplayElements> cosplayElements;

  Characters(
      {this.uuid,
      this.name,
      this.picture,
      this.description,
      this.abilities,
      this.cosplayElements});

  Characters.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    picture = json['picture'];
    description = json['description'];
    if (json['abilities'] != null) {
      abilities = new List<Abilities>();
      json['abilities'].forEach((v) {
        abilities.add(new Abilities.fromJson(v));
      });
    }
    if (json['cosplayelements'] != null) {
      cosplayElements = new List<CosplayElements>();
      json['cosplayelements'].forEach((v) {
        cosplayElements.add(new CosplayElements.fromJson(v));
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
