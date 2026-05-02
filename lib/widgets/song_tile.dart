import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.isCurrentSong,
    required this.title,
    required this.artist,
    required this.albumArtUrl,
    required this.onTilePressed,
  });

  final bool isCurrentSong;
  final String title;
  final String artist;
  final String? albumArtUrl;
  final VoidCallback onTilePressed;

  @override
  Widget build(BuildContext context) {
    final tile = Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        children: [
          // 앨범 아트
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 52,
              height: 52,
              color: Colors.black26,
              child: Image.network(
                albumArtUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.album, size: 52, color: Colors.white54),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      isCurrentSong ? Icons.equalizer : Icons.graphic_eq,
                      size: 16,
                      color: isCurrentSong ? Colors.green : null,
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          color: isCurrentSong ? Colors.green : null,
                          fontWeight: isCurrentSong ? FontWeight.w600 : null,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  artist,
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return InkWell(onTap: onTilePressed, child: tile);
  }
}
