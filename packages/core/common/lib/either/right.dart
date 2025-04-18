import 'package:common/either/either.dart';

class Right<L, R> extends Either<L, R> {
  final R _value;

  Right(this._value);

  @override
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn) {
    return rightFn(_value);
  }

  @override
  bool isLeft() => false;

  @override
  bool isRight() => true;

  @override
  L? getLeftOrNull() => null;

  @override
  R? getRightOrNull() => _value;
}