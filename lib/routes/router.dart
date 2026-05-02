import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sopt_flutter_04/pages/music_player_page.dart';
import 'package:sopt_flutter_04/pages/song_list_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SongListPage()),
    GoRoute(
      path: '/player/:trackId',
      pageBuilder: (context, state) {
        final trackId = state.pathParameters['trackId']!;

        return CustomTransitionPage(
          key: state.pageKey,
          child: MusicPlayerPage(trackId: trackId),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
