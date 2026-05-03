import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopt_flutter_04/data/data_di.dart';
import 'package:sopt_flutter_04/data/entity/song.dart';

/// MVVM ViewModel — 곡 목록 화면의 상태/사용자 의도를 처리한다.
class SongsNotifier extends AutoDisposeAsyncNotifier<List<Song>> {
  // TODO 1. 사용자 입력을 통해 검색어를 변경할 수 있도록 해주세요.
  final String _currentTerm = 'coldplay';

  @override
  FutureOr<List<Song>> build() async {
    return ref.read(songRepositoryProvider).searchSongs(_currentTerm);
  }

  /// 같은 검색어로 다시 불러오기
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref.read(songRepositoryProvider).searchSongs(_currentTerm);
    });
  }

  /// 현재 목록에서 항목 제거 (서버 호출 없이 로컬 상태만)
  void remove(int trackId) {
    final current = state.value ?? [];
    state = AsyncData(current.where((s) => s.trackId != trackId).toList());
  }

  // TODO 2. 검색어 변경 의도를 처리하는 메서드를 구현해주세요.
  Future<void> setTerm(String term) async {}

  /// 즐겨찾기 토글 — 로컬 리스트 즉시 갱신 후 영속화.
  /// 영속화 실패 시 로컬 리스트를 이전 상태로 롤백한다.
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

    // 2) 영속화 — 실패 시 롤백
    try {
      await ref.read(songRepositoryProvider).toggleFavorite(trackId);
    } catch (_) {
      state = AsyncData(current);
    }
  }
}

final songsProvider =
    AsyncNotifierProvider.autoDispose<SongsNotifier, List<Song>>(
      SongsNotifier.new,
    );
