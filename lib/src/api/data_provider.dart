import 'package:croc_hack/src/constants.dart';
import 'package:dio/dio.dart';

import '../exceptions.dart';
import 'json_serializable.dart';

class NetworkDataProvider<T extends JsonSerializable> {
  Dio _dio = new Dio();
  var data;
  T Function(Object object) fromJson;

  NetworkDataProvider({this.fromJson}) {
    // ToDo: add class name parsing
  }

  Future<List<T>> fetchAll() async {
    var response = await _dio
        .get(Constants.SERVICE_URL + T.toString().toLowerCase() + 's');

    if (response == null || response.statusCode != 200)
      throw new FetchDataException(
          message: 'Couldn\'t fetch all ${T.runtimeType}');

    data = List<T>.from(response.data[T.toString().toLowerCase() + 's']
        .map((x) => this.fromJson(x)));
    return data;
  }

  Future<T> fetchById(int id) async {
    var response = await _dio
        .get(Constants.SERVICE_URL + T.toString().toLowerCase() + 's/' + '$id');

    if (response == null || response.statusCode != 200)
      throw new FetchDataException(
          message: 'Couldn\'t fetch ${T.runtimeType} with id:$id');

    data = this.fromJson(response.data);
    return data;
  }

  Future<T> fetchByUrl(String url) async {}
}
