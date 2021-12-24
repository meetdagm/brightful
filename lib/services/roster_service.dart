


import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/models/roster/roster.dart';
import 'package:brightful/models/roster/roster_serializer.dart';
import 'package:brightful/services/database_service.dart';

class RosterService {

  DatabaseService<Roster> _databaseService = DatabaseService(collectionID: "roster", serializer: RosterSerializer());


  add({required Actor actor}) {
    //We need to add to get the document for the specific user
    //If it doesn't exists then we need to create it and add the actor to the roster
    //Then we change the Actors property of available to false and we push it
    
  }

}