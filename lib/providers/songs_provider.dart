import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopt_flutter_04/api/song_api.dart';
import 'package:sopt_flutter_04/models/song.dart';
import 'package:sopt_flutter_04/providers/favorites_provider.dart';

class SongsNotifier extends AutoDisposeAsyncNotifier<List<Song>> {
  final String _currentTerm = 'coldplay';

  @override
  FutureOr<List<Song>> build() async {
    final songs = await searchSongs(_currentTerm);
    // 즐겨찾기 ID 집합을 받아와 isFavorite을 채운다.
    // ref.watch로 의존성을 걸어 favoritesProvider가 바뀌면 자동 재빌드.
    final favorites = await ref.watch(favoritesProvider.future);
    return songs
        .map((s) => s.copyWith(isFavorite: favorites.contains(s.trackId)))
        .toList();
  }

  /// 같은 검색어로 다시 불러오기
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final songs = await searchSongs(_currentTerm);
      final favorites = await ref.read(favoritesProvider.future);
      return songs
          .map((s) => s.copyWith(isFavorite: favorites.contains(s.trackId)))
          .toList();
    });
  }

  /// 현재 목록에서 항목 제거 (서버 호출 없이 로컬 상태만)
  void remove(int trackId) {
    final current = state.value ?? [];
    state = AsyncData(current.where((s) => s.trackId != trackId).toList());
  }

  /// 즐겨찾기 토글 — 로컬 리스트와 영속 상태를 함께 갱신.
  /// build()가 favoritesProvider를 watch하지만, 토글 이벤트마다 검색을
  /// 재호출하지 않도록 로컬 리스트를 즉시 갱신한다.
  Future<void> toggleFavorite(int trackId) async {
    final current = state.value;
    if (current == null) return;

    // 1) 로컬 리스트 즉시 갱신 (UI 반응성)
    state = AsyncData([
      for (final song in current)
        if (song.trackId == trackId)
          song.copyWith(isFavorite: !song.isFavorite)
        else
          song,
    ]);

    // 2) 영속 상태 갱신 (실패 시 FavoritesNotifier가 롤백)
    await ref.read(favoritesProvider.notifier).toggle(trackId);
  }
}

final songsProvider =
    AsyncNotifierProvider.autoDispose<SongsNotifier, List<Song>>(
      SongsNotifier.new,
    );
