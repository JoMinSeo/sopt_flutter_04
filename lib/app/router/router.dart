import 'package:go_router/go_router.dart';

import 'package:sopt_flutter_04/features/song/presentation/routes/song_routes.dart';

/// 앱 전역 라우터 — 각 feature가 노출하는 routes를 합쳐 GoRouter를 구성한다.
///
/// 향후 feature가 추가되면 `...otherFeatureRoutes`처럼 합친다.
final router = GoRouter(
  initialLocation: '/',
  routes: [
    ...songRoutes,
  ],
);
