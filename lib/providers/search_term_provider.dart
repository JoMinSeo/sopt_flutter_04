import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchTermProvider extends AutoDisposeNotifier<String> {
  @override
  String build() {
    return 'coldplay';
  }

  void setTerm(String term) {
    state = term.trim();
  }
}

final searchTermProvider =
    NotifierProvider.autoDispose<SearchTermProvider, String>(
      SearchTermProvider.new,
    );
