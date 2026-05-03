import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sopt_flutter_04/features/song/domain/entities/song.dart';
import 'package:sopt_flutter_04/features/song/song_di.dart';

/// 같은 앨범의 트랙 목록을 가져오는 provider.
///
/// collectionId를 family 인자로 받아 앨범별로 캐시되며, 화면이 dispose되면
/// 함께 정리된다. "현재 곡 제외 + trackNumber 정렬" 정책은 호출 위젯이 처리한다.
final albumSongsProvider = FutureProvider.autoDispose.family<List<Song>, int>(
  (ref, collectionId) async {
    final result =
        await ref.read(getTracksOfAlbumProvider).call(collectionId);
    return result.fold(
      onSuccess: (songs) => songs,
      onFailure: (e) => throw e,
    );
  },
);
