import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sopt_flutter_04/core/network/api_client.dart';
import 'package:sopt_flutter_04/features/song/data/datasources/song_local_data_source.dart';
import 'package:sopt_flutter_04/features/song/data/datasources/song_remote_data_source.dart';
import 'package:sopt_flutter_04/features/song/data/repositories/song_repository_impl.dart';
import 'package:sopt_flutter_04/features/song/domain/repositories/song_repository.dart';
import 'package:sopt_flutter_04/features/song/domain/usecases/get_tracks_of_album.dart';
import 'package:sopt_flutter_04/features/song/domain/usecases/search_songs.dart';
import 'package:sopt_flutter_04/features/song/domain/usecases/toggle_favorite.dart';

/// song feature의 의존성 주입 지점.
///
/// data 계층(API 클라이언트, DataSource, Repository 구현체)과
/// domain 계층의 UseCase를 모두 Riverpod Provider로 노출한다.
/// 테스트 시 `overrideWithValue`로 mock 주입 가능.

// ----- data layer -----

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final songRemoteDataSourceProvider = Provider<SongRemoteDataSource>(
  (ref) => SongRemoteDataSource(ref.watch(apiClientProvider)),
);

final songLocalDataSourceProvider = Provider<SongLocalDataSource>(
  (ref) => SongLocalDataSource(),
);

final songRepositoryProvider = Provider<SongRepository>((ref) {
  return SongRepositoryImpl(
    ref.watch(songRemoteDataSourceProvider),
    ref.watch(songLocalDataSourceProvider),
  );
});

// ----- usecases -----

final searchSongsProvider = Provider<SearchSongs>(
  (ref) => SearchSongs(ref.watch(songRepositoryProvider)),
);

final getTracksOfAlbumProvider = Provider<GetTracksOfAlbum>(
  (ref) => GetTracksOfAlbum(ref.watch(songRepositoryProvider)),
);

final toggleFavoriteProvider = Provider<ToggleFavorite>(
  (ref) => ToggleFavorite(ref.watch(songRepositoryProvider)),
);
