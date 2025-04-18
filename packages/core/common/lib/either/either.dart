abstract class Either<L, R> {
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn);

  bool isLeft();
  bool isRight();

  L? getLeftOrNull();
  R? getRightOrNull();

  R getOrElse(R Function() defaultValue) {
    return isRight() ? getRightOrNull()! : defaultValue();
  }
}
