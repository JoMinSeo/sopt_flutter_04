/// DataSource 계층에서 발생하는 저수준 예외.
///
/// Repository가 catch하여 [Result.failure]로 감싸 도메인 계층으로 전달한다.
class ServerException implements Exception {
  final String message;
  const ServerException(this.message);

  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;
  const CacheException(this.message);

  @override
  String toString() => 'CacheException: $message';
}
