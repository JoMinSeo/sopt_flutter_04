import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_player_provider.freezed.dart';

/// 음악 플레이어 UI 상태 — 데이터 계층 의존 0 (재생 시뮬레이션).
@freezed
abstract class MusicPlayerState with _$MusicPlayerState {
  const factory MusicPlayerState({
    @Default(false) bool isPlaying,
    @Default(0.0) double currentPosition,
    int? currentSongId,
  }) = _MusicPlayerState;
}

class MusicPlayerNotifier extends Notifier<MusicPlayerState> {
  @override
  MusicPlayerState build() => const MusicPlayerState();

  void playSong(int trackId) {
    state = state.copyWith(
      currentSongId: trackId,
      isPlaying: true,
      currentPosition: 0,
    );
  }

  void togglePlay() {
    state = state.copyWith(isPlaying: !state.isPlaying);
  }

  void seekTo(double position) {
    state = state.copyWith(currentPosition: position);
  }
}

final musicPlayerProvider =
    NotifierProvider<MusicPlayerNotifier, MusicPlayerState>(
      MusicPlayerNotifier.new,
    );
