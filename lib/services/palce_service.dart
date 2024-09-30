import 'dart:convert';
import 'package:http/http.dart' as http;

class PlacesService {
  final String apiKey;

  PlacesService(this.apiKey);

  Future<List<dynamic>> searchPlaces(String query) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['predictions'] as List<dynamic>;
    } else {
      throw Exception('Failed to load places');
    }
  }
}
