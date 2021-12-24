

import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/models/serializers/dataSerializers.dart';

class ActorSerializer extends DataSerializer<Actor> {

  @override
  Actor fromJson({String? id, required Map data}) {
    return Actor(
      name: data['name'],
      description: data['description'],
      cost: data['cost'],
      isAvailable: data['isAvailable'],
    );
  }

  @override
  Map<String, dynamic> toJson({required Actor object}) {
    return {
      'name': object.name,
      'description': object.description,
      'cost' : object.cost,
      'isAvailable': object.isAvailable,
    };
  }

}