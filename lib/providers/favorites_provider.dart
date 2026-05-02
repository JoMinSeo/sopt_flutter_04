import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 즐겨찾기 trackId 집합을 관리한다.
/// SharedPreferences에 영속화되어 앱 재시작 후에도 유지된다.
class FavoritesNotifier extends AsyncNotifier<Set<int>> {
  static const _key = 'favorite_track_ids';

  @override
  Future<Set<int>> build() async {
    // SharedPreferences.getInstance()는 비동기 — await 필요
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList(_key) ?? const [];
    return stored.map(int.parse).toSet();
  }

  /// trackId의 즐겨찾기 상태를 토글하고 디스크에 저장한다.
  /// 저장 실패 시 이전 상태로 롤백.
  Future<void> toggle(int trackId) async {
    final current = state.value ?? <int>{};
    final next = Set<int>.from(current);
    next.contains(trackId) ? next.remove(trackId) : next.add(trackId);

    // 1) UI 즉시 반영
    state = AsyncData(next);

    // 2) 영속화 — 실패 시 롤백
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(
        _key,
        next.map((e) => e.toString()).toList(),
      );
    } catch (e, st) {
      state = AsyncData(current);
      state = AsyncError(e, st);
    }
  }
}

final favoritesProvider =
    AsyncNotifierProvider<FavoritesNotifier, Set<int>>(
      FavoritesNotifier.new,
    );
