import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopt_flutter_04/data/entity/song.dart';
import 'package:sopt_flutter_04/data/data_di.dart';

/// 같은 앨범의 트랙 목록을 가져오는 provider.
/// collectionId를 family 인자로 받아 앨범별로 캐시되며,
/// 화면이 dispose되면 함께 정리된다.
///
/// "현재 곡 제외 + trackNumber 정렬" 정책은 호출 위젯이 처리한다 —
/// 이 provider는 collectionId 단위로만 캐시되어 동일 앨범 내에서
/// 다른 곡으로 이동해도 재요청되지 않는다.
final albumSongsProvider = FutureProvider.autoDispose.family<List<Song>, int>((
  ref,
  collectionId,
) async {
  return ref
      .read(songRepositoryProvider)
      .getTracksOfAlbum(collectionId);
});
