
import 'package:brightful/models/actor/actor_serializer.dart';
import 'package:brightful/models/roster/roster.dart';
import 'package:brightful/models/serializers/dataSerializers.dart';

class RosterSerializer extends DataSerializer<Roster> {

  @override
  Roster fromJson({String? id, required Map data}) {
    return Roster(actors: List.from((data['actors'] as List).map((e) => ActorSerializer().fromJson(data: e))));
  }

  @override
  Map<String, dynamic> toJson({required Roster object}) {
    return {
      'actors' : object.actors.map((e) => ActorSerializer().toJson(object: e)),
    };
  }

}