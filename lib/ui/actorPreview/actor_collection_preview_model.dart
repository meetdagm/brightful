
import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/services/actor_service.dart';
import 'package:brightful/services/locator.dart';
import 'package:brightful/services/navigation_service.dart';
import 'package:brightful/services/roster_service.dart';
import 'package:brightful/ui/ActorCreate/create_actor_view.dart';
import 'package:brightful/ui/roster/roster_view.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';



class ActorCollectionPreviewModel extends StreamViewModel<List<Actor>> {


  final NavigationService _navigationService = locator<NavigationService>();
  final ActorService _actorService = ActorService();
  final RosterService _rosterService = RosterService();


  @override
  Stream<List<Actor>> get stream => _actorService.notifyChanges;

  @override
  void onData(List<Actor>? data) {
    data?.sort((a, b) => b.cost.compareTo(a.cost));
    super.onData(data);
  }

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

    return NumberFormat.simpleCurrency(decimalDigits: 0).format(data![index].cost);
  }

  String descriptionForitemAt({required int index}) {
    return data![index].description;
  }

  selectedItemAt({required int index}) async {

    setBusy(true);
    var object = data?[index];
    if (object == null) return;
  
    await _rosterService.add(actor: object, onError: onError, onSuccess: () {
      setBusy(false);
    });

  }

  viewRoster() {
    _navigationService.navigateTo(const RosterView());
  }


}