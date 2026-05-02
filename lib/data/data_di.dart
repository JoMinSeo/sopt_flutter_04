import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopt_flutter_04/data/data_source/song_local_data_source.dart';
import 'package:sopt_flutter_04/data/data_source/song_remote_data_source.dart';
import 'package:sopt_flutter_04/data/repository/song_repository.dart';

/// data 계층의 의존성 주입 지점.
///
/// DataSource / Repository를 Riverpod Provider로 노출하며,
/// 테스트 시 `overrideWithValue`로 mock 주입이 가능하다.

final songRemoteDataSourceProvider = Provider<SongRemoteDataSource>(
  (ref) => SongRemoteDataSource(),
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
