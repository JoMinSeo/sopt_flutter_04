import 'package:sopt_flutter_04/core/error/result.dart';

/// 모든 UseCase의 공통 형태.
///
/// 입력 [Params]을 받아 [Result]로 감싼 [T]를 비동기적으로 반환한다.
abstract interface class UseCase<T, Params> {
  Future<Result<T>> call(Params params);
}

/// 파라미터가 없는 UseCase에 사용하는 sentinel.
class NoParams {
  const NoParams();
}
