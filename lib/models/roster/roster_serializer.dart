
import 'package:brightful/helpers/database_keys.dart';
import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/models/actor/actor_serializer.dart';
import 'package:brightful/models/roster/roster.dart';
import 'package:brightful/models/serializers/dataSerializers.dart';

class RosterSerializer extends DataSerializer<Roster> {

  @override
  Roster fromJson({String? id, required Map data}) {
    print('THis is data back ${data[DatabaseKeys.actors] as List}');
    return Roster(actors: List.from((data[DatabaseKeys.actors] as List).map((e){
      print('This is an element: $e');
      return ActorSerializer().fromJson(data: e);
    })));
  }

  @override
  Map<String, dynamic> toJson({required Roster object}) {
    return {
      DatabaseKeys.actors : object.actors.map((e) => ActorSerializer().toJson(object: e)).toList(),
    };
  }

}