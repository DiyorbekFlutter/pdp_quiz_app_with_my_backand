import 'dart:convert';
import 'dart:developer';
import 'dart:io';

final class NetworkService {
  // static const String wifiApi = "10.10.3.163"; // academy
  // static const String wifiApi = "192.168.0.103"; // home
  static const String wifiApi = "192.168.146.43"; // my phone
  static const String _baseUrl = "$wifiApi:8080";

  static Future<String?> get(String api) async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.parse("http://$_baseUrl$api");

    try{
      HttpClientRequest request = await httpClient.getUrl(url);
      HttpClientResponse response = await request.close();
      httpClient.close();

      if(response.statusCode == HttpStatus.ok) return await response.transform(utf8.decoder).join();
    } catch(e) {
      log(e.toString());
      httpClient.close();
    }

    return null;
  }

  static Future<(String?, int)> post(String api, Map<String, dynamic> data) async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.http(_baseUrl, api);

    try{
      HttpClientRequest request = await httpClient.postUrl(url);
      request.headers.set("Content-Type", "application/json");
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      httpClient.close();

      if(response.statusCode == HttpStatus.ok) {
        return (await response.transform(utf8.decoder).join(), 200);
      } else {
        return (null, response.statusCode);
      }
    } catch(e){
      httpClient.close();
    }

    return (null, 0);
  }

  static Future<bool> put(String api, [Map<String, dynamic>? data]) async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.parse("http://$_baseUrl$api");

    try{
      HttpClientRequest request = await httpClient.putUrl(url);
      request.headers.set("Content-Type", "application/json");
      if(data != null) request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      httpClient.close();
      await response.transform(utf8.decoder).join();

      if(response.statusCode == HttpStatus.ok) return true;
    } catch(e) {
      httpClient.close();
    }

    return false;
  }

  static Future<bool> delete(String api) async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.parse("http://$_baseUrl$api");

    try{
      HttpClientRequest request = await httpClient.deleteUrl(url);
      HttpClientResponse response = await request.close();
      httpClient.close();
      response.transform(utf8.decoder).join();

      if(response.statusCode == HttpStatus.ok) return true;
    } catch(e) {
      httpClient.close();
    }

    return false;
  }
}
