import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sopt_flutter_04/features/song/domain/entities/song.dart';
import 'package:sopt_flutter_04/features/song/song_di.dart';

/// MVVM ViewModel — 곡 목록 화면의 상태와 사용자 의도를 처리한다.
///
/// SearchSongs / ToggleFavorite UseCase를 통해 도메인 계층과만 상호작용한다.
class SongsNotifier extends AutoDisposeAsyncNotifier<List<Song>> {
  static const _initialTerm = 'coldplay';
  String _currentTerm = _initialTerm;

  @override
  FutureOr<List<Song>> build() => _search(_currentTerm);

  /// 검색어 변경 — 빈 문자열·동일 검색어는 무시.
  Future<void> setTerm(String term) async {
    final trimmed = term.trim();
    if (trimmed.isEmpty || trimmed == _currentTerm) return;
    _currentTerm = trimmed;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _search(trimmed));
  }

  /// 같은 검색어로 다시 불러오기.
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _search(_currentTerm));
  }

  /// 현재 목록에서 항목 제거 (서버 호출 없이 로컬 상태만).
  void remove(int trackId) {
    final current = state.value ?? [];
    state = AsyncData(current.where((s) => s.trackId != trackId).toList());
  }

  /// 즐겨찾기 토글 — 낙관적 갱신 후 영속화 실패 시 롤백.
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
    final result = await ref.read(toggleFavoriteProvider).call(trackId);
    result.fold<void>(
      onSuccess: (_) {},
      onFailure: (_) {
        state = AsyncData(current);
      },
    );
  }

  Future<List<Song>> _search(String term) async {
    final result = await ref.read(searchSongsProvider).call(term);
    return result.fold(
      onSuccess: (songs) => songs,
      onFailure: (e) => throw e,
    );
  }
}

final songsProvider =
    AsyncNotifierProvider.autoDispose<SongsNotifier, List<Song>>(
      SongsNotifier.new,
    );
