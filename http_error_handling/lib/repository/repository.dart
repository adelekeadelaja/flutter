abstract class Repository<T> {
  Future delete();
  Future<T> create(T model);
  Future<T> get();
  Future<T> update(T model);
  Future<List<T>> search();
}
