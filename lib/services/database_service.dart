
import 'dart:async';
import 'package:brightful/models/serializers/dataSerializers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService<T> {

  String collectionID;
  DataSerializer<T> serializer;
  late final CollectionReference _collectionReference;
  final StreamController<List<T>> _streamController = StreamController<List<T>>.broadcast();

  DatabaseService({required this.collectionID, required this.serializer}) {
    _collectionReference = FirebaseFirestore.instance.collection(collectionID);
  }


  Stream<List<T>> listen() {

    _collectionReference.snapshots().listen((event) {
      List<T> objectCollection = List.from(event.docs.map((doc) => serializer.fromJson(id: doc.id, data: doc.data() as Map)));
      _streamController.add(objectCollection);
    });

    return _streamController.stream;
  }



  create({String? id, required T object, required Function(String) onError, required Function onSuccess}) async {

    return await _collectionReference.doc(id)
    .set(serializer.toJson(object: object))
    .then((value) => onSuccess())
    .catchError((error) => onError(error));

  }


  Future<T?> read({required String id, required Function(String) onError}) async {
    await _collectionReference.doc(id).get()
    .then((document) {
      print("Came back from reading ${document.data()}");
      if (document.data() == null) {
        return null;
      }
      Map data = document.data() as Map;
      return serializer.fromJson(data: data);
    })
    .catchError((error) {
      onError(error);
      return null;
    });
  }

  update({required String id, required Map<String, dynamic> newValue, required Function(String) onError, required Function onSuccess}) async{
    await _collectionReference.doc(id).update(newValue).then((value) => onSuccess()).catchError((error) => onError(error));
  }


  // incrementKeyValue({required String id, required String key, int byValue = 1}) async{
  //   await _collectionReference.doc(id).update({
  //     key: FieldValue.increment(byValue),
  //   });
  // }


  appendToArray({required String id, required String key, required List value, required Function onSuccess, required Function(String?) onError}) async {
    await _collectionReference.doc(id).update({key: FieldValue.arrayUnion(value)}).then((value) => onSuccess).catchError((error) => onError(error));
  }
  






}