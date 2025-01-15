import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:socialchamptask/network/core/network_api_method.dart';
/// Implementation of the NetworkApiMethods interface.
/// This class handles the network requests using HTTP.
class NetworkApiMethodsImpl<T> implements NetworkApiMethods<T> {
  @override
  Future<List<dynamic>> getApi(String url, customHeaders) async {
    final response = await http.get(Uri.parse(url), headers: customHeaders);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Future postApi(
      String url, String payload, Map<String, String> customHeaders) {
    throw UnimplementedError();
  }
}
