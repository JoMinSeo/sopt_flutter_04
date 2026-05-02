import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sopt_flutter_04/models/song.dart';
import 'package:sopt_flutter_04/providers/music_player_provider.dart';
import 'package:sopt_flutter_04/providers/song_providers.dart';
import 'package:sopt_flutter_04/providers/songs_provider.dart';

class MusicPlayerPage extends ConsumerStatefulWidget {
  const MusicPlayerPage({super.key, required this.trackId});

  final String trackId;

  @override
  ConsumerState<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends ConsumerState<MusicPlayerPage> {
  String _formatTime(double seconds) {
    final min = seconds ~/ 60;
    final sec = (seconds % 60).toInt();
    return '$min:${sec.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(musicPlayerProvider);
    final songs = ref.watch(songsProvider);

    final song = songs.when(
      data: (songs) {
        return songs
            .where((element) => element.trackId == int.parse(widget.trackId))
            .firstOrNull;
      },
      error: (error, stack) => null,
      loading: () => null,
      skipLoadingOnReload: true,
    );

    if (song == null) {
      return const Scaffold(body: Center(child: Text('곡을 찾을 수 없습니다.')));
    }

    final albumSongs = ref.watch(albumSongsProvider(song.collectionId));

    return Scaffold(
      backgroundColor: const Color(0xFF9E8E55),
      appBar: _buildAppBar(song),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // 앨범 아트
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  height: 350,
                  color: Colors.black26,
                  child: Image.network(
                    song.artworkUrl100 ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(
                        Icons.album,
                        size: 120,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 곡 정보 + 좋아요
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.trackName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          song.artistName,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(songsProvider.notifier)
                          .toggleFavorite(song.trackId);
                    },
                    child: Icon(
                      song.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: song.isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Slider(
                value: playerState.currentPosition,
                onChanged: (position) {
                  ref.read(musicPlayerProvider.notifier).seekTo(position);
                },
                activeColor: Colors.white,
                inactiveColor: Colors.white38,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatTime(
                        playerState.currentPosition *
                            (song.trackTimeMillis / 1000),
                      ),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '-${_formatTime((1 - playerState.currentPosition) * (song.trackTimeMillis / 1000))}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 컨트롤 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.shuffle, color: Colors.white, size: 24),
                  const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 36,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(musicPlayerProvider.notifier).togglePlay();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        playerState.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.black,
                        size: 36,
                      ),
                    ),
                  ),
                  const Icon(Icons.skip_next, color: Colors.white, size: 36),
                  const Icon(Icons.repeat, color: Colors.white, size: 24),
                ],
              ),

              const SizedBox(height: 32),

              // 같은 앨범의 다른 곡
              _AlbumSongsSection(
                currentTrackId: song.trackId,
                songs: albumSongs,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(Song song) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        onPressed: () => context.pop(),
      ),
      title: Text(
        song.artistName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _AlbumSongsSection extends StatelessWidget {
  const _AlbumSongsSection({required this.currentTrackId, required this.songs});

  final int currentTrackId;
  final AsyncValue<List<Song>> songs;

  String _formatDuration(int millis) {
    final totalSec = millis ~/ 1000;
    final min = totalSec ~/ 60;
    final sec = totalSec % 60;
    return '$min:${sec.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '앨범 더보기 ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        songs.when(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
          error: (error, stack) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text(
                '앨범 트랙을 불러오지 못했습니다.\n$error',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
          data: (tracks) {
            final others =
                tracks.where((t) => t.trackId != currentTrackId).toList()..sort(
                  (a, b) => (a.trackNumber ?? 0).compareTo(b.trackNumber ?? 0),
                );

            if (others.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  '이 앨범에 다른 곡이 없습니다.',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return Column(
              children: others.map((t) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.trackName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              t.artistName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatDuration(t.trackTimeMillis),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
