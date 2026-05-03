import 'package:shared_preferences/shared_preferences.dart';

import 'package:sopt_flutter_04/core/error/exceptions.dart';
import 'package:sopt_flutter_04/core/utils/constants.dart';

/// 곡 도메인의 로컬 영속 저장소.
///
/// 현재는 즐겨찾기 trackId 집합만 보관하지만, 향후 최근 검색어·곡 캐시 등
/// 같은 도메인의 로컬 데이터가 추가되면 이 클래스가 함께 책임진다.
///
/// SharedPreferences 디테일(키, 원시 타입 직렬화)은 여기서만 다룬다.
/// 실패 시 [CacheException]을 던진다.
class SongLocalDataSource {
  Future<Set<int>> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final stored =
          prefs.getStringList(StorageKeys.favoriteTrackIds) ?? const [];
      return stored.map(int.parse).toSet();
    } catch (e) {
      throw CacheException('즐겨찾기 로드 실패: $e');
    }
  }

  Future<void> saveFavorites(Set<int> ids) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(
        StorageKeys.favoriteTrackIds,
        ids.map((e) => e.toString()).toList(),
      );
    } catch (e) {
      throw CacheException('즐겨찾기 저장 실패: $e');
    }
  }
}
