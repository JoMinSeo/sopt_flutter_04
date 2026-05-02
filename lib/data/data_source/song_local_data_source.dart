import 'package:shared_preferences/shared_preferences.dart';

/// 곡 도메인의 로컬 영속 저장소.
///
/// 현재는 즐겨찾기 trackId 집합만 보관하지만, 향후 최근 검색어·곡 캐시 등
/// 같은 도메인의 로컬 데이터가 추가되면 이 클래스가 함께 책임진다.
///
/// SharedPreferences 디테일(키, 원시 타입 직렬화)은 여기서만 다룬다.
class SongLocalDataSource {
  static const _favoritesKey = 'favorite_track_ids';

  Future<Set<int>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList(_favoritesKey) ?? const [];
    return stored.map(int.parse).toSet();
  }

  Future<void> saveFavorites(Set<int> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _favoritesKey,
      ids.map((e) => e.toString()).toList(),
    );
  }
}
