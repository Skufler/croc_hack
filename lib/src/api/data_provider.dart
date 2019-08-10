import 'package:croc_hack/src/constants.dart';
import 'package:dio/dio.dart';

import '../exceptions.dart';
import 'json_serializable.dart';

class NetworkDataProvider<T extends JsonSerializable> {
  Dio _dio = new Dio();
  var data;
  T Function(Object object) fromJson;
  // NetworkDataProvider({this.fromJson, List<dynamic> data});

  NetworkDataProvider({this.fromJson});

//  factory NetworkDataProvider.fromJson(
//      Map<String, dynamic> json, T fromJson()) {
//    return NetworkDataProvider(
//        fromJson: fromJson /*, data: json[T.toString().toLowerCase()]*/);
//  }

  Future<List<T>> fetchAll() async {
    print(Constants.SERVICE_URL + T.toString().toLowerCase() + 's');
    var response = await _dio
        .get(Constants.SERVICE_URL + T.toString().toLowerCase() + 's');
    //.get("");
    if (response == null || response.statusCode != 200)
      throw new FetchDataException(
          message: 'Couldn\'t fetch all ${T.runtimeType}');

    // List<T>.from(response.data[T.toString().toLowerCase() + 's'].map((x) => fromJson(x)))

    data = List<T>.from(response.data[T.toString().toLowerCase() + 's']
        .map((x) => this.fromJson(x)));
    return data;
  }

  Future<T> fetchById(int id) async {}

  Future<T> fetchByUrl(String url) async {}
}
