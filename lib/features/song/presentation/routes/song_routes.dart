import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:sopt_flutter_04/features/song/presentation/pages/music_player_page.dart';
import 'package:sopt_flutter_04/features/song/presentation/pages/song_list_page.dart';

/// song feature가 노출하는 라우트.
///
/// 앱 루트(`app/router/router.dart`)가 이 리스트를 펼쳐서 GoRouter에 합친다.
final List<RouteBase> songRoutes = [
  GoRoute(path: '/', builder: (context, state) => const SongListPage()),
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
];
