


import 'package:brightful/models/actor/actor.dart';

class Roster {

  List<Actor> actors;

  Roster({required this.actors}) {
    actors.sort((a, b) => b.cost.compareTo(a.cost));
  }

}