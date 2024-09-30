import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_map_app/controller/search_notifier.dart';
import 'package:google_map_app/pages/search_page.dart';
import 'package:google_map_app/services/palce_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesSearchScreen extends ConsumerWidget {
  final PlacesService placesService =
      PlacesService('AIzaSyAKYvan7-mVt87Rg7h0fh-aISrKChM-JX0');

  List<dynamic> places = [];
  GoogleMapController? mapController;

  FocusNode textFocus = FocusNode();

  PlacesSearchScreen({Key? key}) : super(key: key);

  void _showBottomSheet(
      BuildContext context, Map<String, dynamic> placeDetails) {
    final String name = placeDetails['name'] ?? 'No Name';
    final String description =
        placeDetails['formatted_address'] ?? 'No Address';
    final List<dynamic> photos = placeDetails['photos'] ?? [];
    String? photoUrl;

    if (photos.isNotEmpty) {
      final photoReference = photos[0]['photo_reference'];
      photoUrl =
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=AIzaSyAKYvan7-mVt87Rg7h0fh-aISrKChM-JX0';
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.6,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                if (photoUrl != null)
                  Image.network(photoUrl, fit: BoxFit.cover),
                const SizedBox(height: 10),
                Text(description),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _moveToLocation(LatLng location) async {
    if (mapController != null) {
      await mapController!.animateCamera(CameraUpdate.newLatLng(location));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchList = ref.watch(searchProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque, // HitTestBehavior 설정
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.7749, -122.4194), // San Francisco
                zoom: 18,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SearchBar(
                    controller: searchList,
                    focusNode: textFocus,
                    onTap: () async {
                      final selectedPlace = await Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation1,
                              Animation<double> animation2) {
                            return const SearchPage(); //변경 필요
                          },
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );

                      if (selectedPlace != null) {
                        final location = LatLng(
                          selectedPlace['geometry']['location']['lat'],
                          selectedPlace['geometry']['location']['lng'],
                        );
                        print(
                            'Moving to: ${location.latitude}, ${location.longitude}');
                        await _moveToLocation(location);
                        _showBottomSheet(context, selectedPlace);
                      }
                    },
                    hintText: 'Search places...',
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
