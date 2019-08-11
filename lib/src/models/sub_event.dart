class SubEvent {
  int uuid;
  String name;
  String description;
  String date;
  String picture;

  SubEvent({this.uuid, this.name, this.description, this.date, this.picture});

  SubEvent.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    picture = json['picture'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['picture'] = this.picture;
    data['date'] = this.date;
    return data;
  }
}
