
import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/models/actor/actor_serializer.dart';
import 'package:brightful/models/roster/roster.dart';
import 'package:brightful/models/roster/roster_serializer.dart';
import 'package:brightful/services/database_service.dart';
import 'package:brightful/services/locator.dart';
import 'package:brightful/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';



class ActorCollectionPreviewModel extends StreamViewModel<List<Actor>> {


  final DatabaseService<Actor> _actorDB = DatabaseService(collectionID: "actors", serializer: ActorSerializer());
  final DatabaseService<Roster> _rosterDB = DatabaseService(collectionID: "roster", serializer: RosterSerializer());
  final NavigationService _navigationService = locator<NavigationService>();


  @override
  Stream<List<Actor>> get stream => _actorDB.listen();

  get count => null;

  add() {
    _navigationService.navigateTo(Container());
  }

  String titleForItemAt({required int index}) {
    return "";
  }

  String subTitleForItemAt({required int index}) {
    return "";
  }

  String descriptionForitemAt({required int index}) {
    return "";
  }

  selectedItemAt({required int index}) {

  }

}