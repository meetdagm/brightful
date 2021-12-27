


import 'package:brightful/helpers/database_keys.dart';
import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/models/actor/actor_serializer.dart';
import 'package:brightful/models/roster/roster.dart';
import 'package:brightful/models/roster/roster_serializer.dart';
import 'package:brightful/services/actor_service.dart';
import 'package:brightful/services/auth_service.dart';
import 'package:brightful/services/database_service.dart';
import 'package:brightful/services/locator.dart';

class RosterService {

  /* 
  This class handles the roster for a specific user.
  By removing or adding a new actor to the user's roster.
  
  */

  

  final DatabaseService<Roster> _databaseService = DatabaseService(collectionID: "roster", serializer: RosterSerializer());
  final AuthService _authService = locator<AuthService>();
  final ActorService _actorService = ActorService();

  Future<Roster?> getRoster(Function(String?) onError) async {
    return _databaseService.read(id: _authService.currentUserID ?? '', onError: onError);
  }


  add({required Actor actor, required Function(String?) onError, required Function onSuccess}) async {
    //We need to add to get the document for the specific user
    //If it doesn't exists then we need to create it and add the actor to the roster
    //Then we change the Actors property of available to false and we push it  
    var rosterID = _authService.currentUserID;
    if (rosterID == null) return;
    await _actorService.toggleAvailabilityFor(model: actor, onError: onError, onSuccess: onSuccess);
    //Check if 
    await _databaseService.appendToArray(id: rosterID, key: DatabaseKeys.actors, value: [ActorSerializer().toJson(object: actor)], onError: onError, onSuccess: onSuccess);
  }


  





}