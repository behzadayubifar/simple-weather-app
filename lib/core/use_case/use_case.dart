abstract interface class UseCase<T, P> {
  Future<T> call(P param);
}
