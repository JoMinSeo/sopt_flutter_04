import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sopt_flutter_04/providers/music_player_provider.dart';
import 'package:sopt_flutter_04/providers/songs_provider.dart';
import 'package:sopt_flutter_04/widgets/song_tile.dart';

class SongListPage extends ConsumerWidget {
  const SongListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(musicPlayerProvider);

    final songAsync = ref.watch(songsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('플레이리스트')),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.read(songsProvider.notifier).refresh();
          },
          child: songAsync.when(
            data: (songs) {
              return ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  final isCurrentSong =
                      playerState.currentSongId == song.trackId;

                  return Dismissible(
                    key: ValueKey(song.trackId),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      ref.read(songsProvider.notifier).remove(song.trackId);
                    },
                    child: SongTile(
                      isCurrentSong: isCurrentSong,
                      title: song.trackName,
                      artist: song.artistName,
                      albumArtUrl: song.artworkUrl100,
                      onTilePressed: () {
                        ref
                            .read(musicPlayerProvider.notifier)
                            .playSong(song.trackId);
                        context.push('/player/${song.trackId}');
                      },
                    ),
                  );
                },
              );
            },
            error: (error, stack) => Center(child: Text('Error: $error')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
