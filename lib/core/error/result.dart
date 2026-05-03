/// Utility class that simplifies handling errors.
///
/// Return a [Result] from a function to indicate success or failure.
///
/// A [Result] is either an [Success] with a value of type [T]
/// or an [Error] with an [Exception].
///
/// Use [Result.success] to create a successful result with a value of type [T].
/// Use [Result.failure] to create an error result with an [Exception].
sealed class Result<T> {
  const Result();

  /// Creates an instance of Result containing a value
  factory Result.success(T value) => Success(value);

  /// Create an instance of Result containing an error
  factory Result.failure(Exception error) => Failure(error);

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Exception e) onFailure,
  }) {
    return switch (this) {
      Success(:final value) => onSuccess(value),
      Failure(:final error) => onFailure(error),
    };
  }
}

/// Subclass of Result for values
final class Success<T> extends Result<T> {
  const Success(this.value);

  /// Returned value in result
  final T value;
}

/// Subclass of Result for errors
final class Failure<T> extends Result<T> {
  const Failure(this.error);

  /// Returned error in result
  final Exception error;
}
