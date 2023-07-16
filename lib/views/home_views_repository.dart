import 'dart:convert';

import '../utils/model/dummy_response.dart';
import 'package:http/http.dart' as http;

class HomeViewsRepository {
  Future<List<DummyResponse>> fetchDummyData() async {
    final response = await http.get(
        Uri.parse('https://retoolapi.dev/Wax7BM/dummyAxisData'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => DummyResponse.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load dummy data');
    }
  }
}

final homeViewsRepository = HomeViewsRepository();


