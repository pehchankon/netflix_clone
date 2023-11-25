import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<dynamic> fetchData(String endpoint, {Map<String, dynamic>? params}) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data from $endpoint');
    }
  }
}