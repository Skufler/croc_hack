class Abilities {
  int uuid;
  String name;
  String description;
  int damage;
  String picture;

  Abilities(
      {this.uuid, this.name, this.description, this.damage, this.picture});

  Abilities.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    description = json['description'];
    damage = json['damage'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['damage'] = this.damage;
    data['picture'] = this.picture;
    return data;
  }
}
