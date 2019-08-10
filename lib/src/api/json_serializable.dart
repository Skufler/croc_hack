abstract class JsonSerializable {
  JsonSerializable();

  JsonSerializable.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
