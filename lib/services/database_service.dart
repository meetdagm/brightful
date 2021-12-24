
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


  create({String? id, required T object, required Function(String) onError, required Function onSuccess}) async {

    return await _collectionReference.doc(id)
    .set(serializer.toJson(object: object))
    .onError((error, stackTrace) => onError(error.toString()))
    .then((value) => onSuccess());

  }


  Stream<List<T>> listen() {

    _collectionReference.snapshots().listen((event) {
      List<T> objectCollection = List.from(event.docs.map((doc) => serializer.fromJson(id: doc.id, data: doc.data() as Map)));
      _streamController.add(objectCollection);
    });

    return _streamController.stream;
  }


  read() {

  }


  delete() {

  }



  update() {

  }


  incrementKeyValue({required String id, required String key, int byValue = 1}) async{
    await _collectionReference.doc(id).update({
      key: FieldValue.increment(byValue),
    });
  }

  






}