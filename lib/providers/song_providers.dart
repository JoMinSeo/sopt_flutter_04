import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopt_flutter_04/api/song_api.dart';
import 'package:sopt_flutter_04/models/song.dart';

/// 같은 앨범의 트랙 목록을 가져오는 provider.
/// collectionId를 family 인자로 받아 앨범별로 캐시되며,
/// 화면이 dispose되면 함께 정리된다.
final albumSongsProvider = FutureProvider.autoDispose.family<List<Song>, int>((
  ref,
  collectionId,
) async {
  return await lookupAlbumSongs(collectionId);
});
