import 'package:common/either/either.dart';

class Left<L, R> extends Either<L, R> {
  final L _value;

  Left(this._value);

  @override
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn) {
    return leftFn(_value);
  }

  @override
  bool isLeft() => true;

  @override
  bool isRight() => false;

  @override
  L? getLeftOrNull() => _value;

  @override
  R? getRightOrNull() => null;
}