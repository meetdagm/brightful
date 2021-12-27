

import 'package:brightful/helpers/database_keys.dart';
import 'package:brightful/models/roster/roster.dart';
import 'package:brightful/models/roster/roster_serializer.dart';
import 'package:brightful/services/auth_service.dart';
import 'package:brightful/services/database_service.dart';
import 'package:brightful/services/locator.dart';
import 'package:brightful/services/roster_service.dart';
import 'package:stacked/stacked.dart';

class RosterViewModel extends FutureViewModel<Roster?> {

  
  final RosterService _rosterService = RosterService();
  
  @override
  Future<Roster?> futureToRun() => _rosterService.getRoster(handleError);

  @override
  onData(Roster? data) {
    print("We've got the data");
    super.onData(data);
  }

  int get count {
    if (data == null) return 0;
    return data!.actors.length;
  }

  handleError(String? error) {
    setBusy(false);
    notifyListeners();
    print('An error occured');
  }




}