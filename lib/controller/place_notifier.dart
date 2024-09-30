import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_map_app/services/palce_service.dart';
import 'package:http/http.dart' as http;

final placeProvider =
    StateNotifierProvider<PlaceNotifier, List<dynamic>>((ref) {
  return PlaceNotifier();
});

class PlaceNotifier extends StateNotifier<List<dynamic>> {
  PlaceNotifier() : super([]);

  final PlacesService placesService =
      PlacesService('AIzaSyAKYvan7-mVt87Rg7h0fh-aISrKChM-JX0');

  Future<List<dynamic>> searchPlaces(String query) async {
    const apiKey = 'AIzaSyAKYvan7-mVt87Rg7h0fh-aISrKChM-JX0';
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&lang=ko&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['predictions'] as List<dynamic>;
    } else {
      throw Exception('Failed to load places');
    }
  }

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    const apiKey = 'AIzaSyAKYvan7-mVt87Rg7h0fh-aISrKChM-JX0';
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&lang=ko&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['result'] as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load place details');
    }
  }

  void search(String query) async {
    if (query.isNotEmpty) {
      final results = await searchPlaces(query);
      state = results;
    } else {
      state = [];
    }
  }
}
