import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_app/controller/search_notifier.dart';
import 'package:google_map_app/pages/search_page.dart';
import 'package:google_map_app/services/palce_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesSearchScreen extends ConsumerWidget {
  PlacesSearchScreen({Key? key}) : super(key: key);

  final PlacesService placesService =
      PlacesService('AIzaSyAKYvan7-mVt87Rg7h0fh-aISrKChM-JX0');

  List<dynamic> places = [];
  GoogleMapController? mapController;

  FocusNode textFocus = FocusNode();

  Future<LatLng> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // 현재 위치 가져오기
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return LatLng(position.latitude, position.longitude);
  }

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
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: FutureBuilder<LatLng>(
            future: _getCurrentLocation(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Stack(
                  children: [
                    GoogleMap(
                      onMapCreated: (controller) {
                        mapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                        target: snapshot.data!,
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
                                    return const SearchPage();
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
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
