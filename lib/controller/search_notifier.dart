import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, TextEditingController>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<TextEditingController> {
  SearchNotifier() : super(TextEditingController());
}
