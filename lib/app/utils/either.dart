// class Either<L, R> {
//   final L? left;
//   final R? right;
//   Either(this.left, this.right);
//   factory Either.left(L l) => Either(l, null);
//   factory Either.right(R r) => Either(null, r);
//   T fold<T>(T Function(L) ifLeft, T Function(R) ifRight) {
//     if (left != null) {
//       return ifLeft(left as L);
//     } else {
//       return ifRight(right as R);
//     }
//   }
// }
//
// class Left<L, R> extends Either<L, R> {
//   final L l;
//   Left(this.l) : super(l, null);
//   @override
//   T fold<T>(T Function(L left) ifLeft, T Function(R right) ifRight) {
//     print(left.runtimeType);
//
//     return ifLeft(left as L);
//   }
// }
//
// class Right<L, R> extends Either<L, R> {
//   final R r;
//   Right(this.r) : super(null, r);
//   @override
//   T fold<T>(T Function(L left) ifLeft, T Function(R right) ifRight) =>
//       ifRight(right as R);
// }
//
// Either<L, R> left<L, R>(L l) => Left(l);
// Either<L, R> right<L, R>(R r) => Right(r);
