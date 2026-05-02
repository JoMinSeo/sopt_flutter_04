import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicPlayerState {
  final bool isPlaying;
  final double currentPosition;
  final int? currentSongId;

  const MusicPlayerState({
    required this.isPlaying,
    required this.currentPosition,
    this.currentSongId,
  });

  // copyWith: 일부 값만 바꾼 새 인스턴스를 만드는 패턴
  MusicPlayerState copyWith({
    bool? isPlaying,
    double? currentPosition,
    int? currentSongId,
  }) {
    return MusicPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentPosition: currentPosition ?? this.currentPosition,
      currentSongId: currentSongId ?? this.currentSongId,
    );
  }
}

class MusicPlayerNotifier extends Notifier<MusicPlayerState> {
  @override
  MusicPlayerState build() {
    return MusicPlayerState(
      isPlaying: false,
      currentPosition: 0.0,
      currentSongId: null,
    );
  }

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
