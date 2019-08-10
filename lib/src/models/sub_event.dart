class SubEvents {
  int uuid;
  String name;
  String description;
  String date;

  SubEvents({this.uuid, this.name, this.description, this.date});

  SubEvents.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date'] = this.date;
    return data;
  }
}