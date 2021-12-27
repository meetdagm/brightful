
import 'package:brightful/helpers/database_keys.dart';
import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/models/actor/actor_serializer.dart';
import 'package:brightful/services/database_service.dart';
import 'package:brightful/services/locator.dart';
import 'package:brightful/services/navigation_service.dart';
import 'package:brightful/ui/ActorCreate/create_actor_view.dart';
import 'package:brightful/ui/roster/roster_view.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';



class ActorCollectionPreviewModel extends StreamViewModel<List<Actor>> {


  final DatabaseService<Actor> _actorDB = DatabaseService(collectionID: DatabaseKeys.actors, serializer: ActorSerializer());
  final NavigationService _navigationService = locator<NavigationService>();


  @override
  Stream<List<Actor>> get stream => _actorDB.listen();

  @override
  List<Actor>? get data {
    return super.data?.where((element) => element.isAvailable).toList();
  }

  int get count {
    return data?.length ?? 0;
  }

  add() {
    _navigationService.navigateTo(CreateActorView());
  }

  String titleForItemAt({required int index}) {
    return data![index].name;
  }

  String subTitleForItemAt({required int index}) {

    return NumberFormat.simpleCurrency().format(data![index].cost);
  }

  String descriptionForitemAt({required int index}) {
    return data![index].description;
  }

  selectedItemAt({required int index}) async {
    setBusy(true);
    var object = data?[index];
    if (object == null || object.id == null) return;
    await _actorDB.update(id: object.id!, newValue: {'isAvailable': false }, onError: onError, onSuccess: () {
      setBusy(false);
    });
    setBusy(false);
  }


  viewRoster() {
    _navigationService.navigateTo(const RosterView());
  }


}