abstract class NetworkApiMethods<T>{
  Future<dynamic> getApi(String url, Map<String, String> customHeaders);
  Future<dynamic> postApi(String url, String payload, Map<String, String> customHeaders);
}