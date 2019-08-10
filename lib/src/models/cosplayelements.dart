class CosplayElements {
  int uuid;
  String name;
  int cost;
  String url;

  CosplayElements({this.uuid, this.name, this.cost, this.url});

  CosplayElements.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    cost = json['cost'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['url'] = this.url;
    return data;
  }
}
