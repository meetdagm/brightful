


import 'package:brightful/helpers/database_keys.dart';
import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/models/actor/actor_serializer.dart';
import 'package:brightful/services/database_service.dart';



class ActorService {

  /* 
  This class handles a collection of actors
  updateActorsAvailability
  ListenToActorsCollection
  make a specific actor unavailable

  */

  final DatabaseService<Actor> _databaseService = DatabaseService(collectionID: DatabaseKeys.actors, serializer: ActorSerializer());

  Stream<List<Actor>> get changes => _databaseService.listen();

  add({required Actor model, required Function(String?) onError, required Function onSuccess}) async {
    await _databaseService.create(object: model, onError: onError, onSuccess: onSuccess);
  }

  toggleAvailabilityFor({required Actor model, required Function(String?) onError, required Function onSuccess}) async {
    var actorID = model.id;
    if (actorID == null) return;
    await _databaseService.update(id: actorID, newValue: { 'isAvailable' : !model.isAvailable }, onError: onError, onSuccess: onSuccess);
  }


}