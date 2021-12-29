abstract class DataSerializer<T> {
  T fromJson({String? id, required Map data});
  Map<String, dynamic> toJson({required T object});
}