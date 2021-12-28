


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
  

  Future<Roster?> getRoster(Function(String?) onError) => _databaseService.read(id: _authService.currentUserID ?? '', onError: onError);
  


  add({required Actor actor, required Function(String?) onError, required Function onSuccess}) async {
    
    //We will be using the userID to look up the user's roster
    var rosterID = _authService.currentUserID;
    if (rosterID == null) return;

    //We will then toggle the actors availability
    await _toggleAvailabilityFor(actor: actor, onError: onError, onSuccess: onSuccess);

    //We check if the roster exists and it i's not the first time it's being created
    if(await _rosterIsAvailable()) {
      
      //if the roster is available we will update the user's roster by adding the actor
      await _databaseService.appendToArray(
        id: rosterID, 
        key: DatabaseKeys.actors, 
        value: [ActorSerializer().toJson(object: actor)], 
        onError: (error) => () async {

          //if an  error occurs than we have to toggle the availabilty back because we couldn't check for his availability
          await _toggleAvailabilityFor(actor: actor, onError: onError, onSuccess: onSuccess);
          onError(error);
        }, 
        onSuccess: onSuccess,
      );

    } else { //If the roster doesn't exist then we will go ahead and create the roster
      
      await _databaseService.create(id: rosterID, object: Roster(actors: [actor]), onError: (error) => () async {

        //if an  error occurs than we have to toggle the availabilty back because we couldn't check for his availability
          await _toggleAvailabilityFor(actor: actor, onError: onError, onSuccess: onSuccess);
          onError(error);

      }, onSuccess: onSuccess);
    }
    
  }

  _toggleAvailabilityFor({required Actor actor, required Function(String?) onError, required Function onSuccess}) async {
    return await _actorService.toggleAvailabilityFor(model: actor, onError: onError, onSuccess: onSuccess);
  }

  //This function checks if a roster exists in the DB
  Future<bool> _rosterIsAvailable() async {
    return await _databaseService.documentExists(id: _authService.currentUserID ?? "");
  }

  remove({required Actor actor, required Function(String?) onError, required Function onSuccess}) async {
    return await _toggleAvailabilityFor(actor: actor, onError: onError, onSuccess: onSuccess); 
  }

  





}