import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_map_app/controller/place_notifier.dart';
import 'package:google_map_app/controller/search_notifier.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchList = ref.watch(searchProvider);
    final placeList = ref.watch(placeProvider);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBar(
              controller: searchList,
              onChanged: ref.read(placeProvider.notifier).search,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              trailing: const [Icon(Icons.mic)],
              hintText: 'Search places...',
              hintStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 18)),
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: placeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(placeList[index]['description']),
                    onTap: () async {
                      final placeId = placeList[index]['place_id'];
                      final placeDetails = await ref
                          .read(placeProvider.notifier)
                          .getPlaceDetails(placeId);
                      print(placeDetails);
                      Navigator.pop(context, placeDetails);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
