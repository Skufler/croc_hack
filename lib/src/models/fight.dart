class Fights {
  int uuid;
  String name;
  String date;
  String picture;

  Fights({this.uuid, this.name, this.date, this.picture});

  Fights.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    date = json['date'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['date'] = this.date;
    data['picture'] = this.picture;
    return data;
  }
}
