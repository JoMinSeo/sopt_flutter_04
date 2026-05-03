import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sopt_flutter_04/features/song/presentation/providers/music_player_provider.dart';
import 'package:sopt_flutter_04/features/song/presentation/providers/songs_provider.dart';
import 'package:sopt_flutter_04/features/song/presentation/widgets/song_tile.dart';

class SongListPage extends ConsumerStatefulWidget {
  const SongListPage({super.key});

  @override
  ConsumerState<SongListPage> createState() => _SongListPageState();
}

class _SongListPageState extends ConsumerState<SongListPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(musicPlayerProvider);
    final songAsync = ref.watch(songsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('플레이리스트')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: '아티스트 또는 곡명',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onSubmitted: (term) {
                  ref.read(songsProvider.notifier).setTerm(term);
                },
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(songsProvider.notifier).refresh();
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            ref
                                .read(songsProvider.notifier)
                                .remove(song.trackId);
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
                  error: (error, stack) =>
                      Center(child: Text('Error: $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
