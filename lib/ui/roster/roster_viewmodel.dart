

import 'dart:async';

import 'package:brightful/models/roster/roster.dart';
import 'package:brightful/services/roster_service.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class RosterViewModel extends StreamViewModel<Roster?> {

  
  final RosterService _rosterService = RosterService();

  @override
  Stream<Roster?> get stream => _rosterService.listenToChanges();
  
  
  
  int get count {
    if (data == null) return 0;
    return data!.actors.length;
  }

  int get _total {
    if (data == null) return 0;
    return data!.actors.fold(0, (previousValue, element) => previousValue + element.cost);
  }

  String get getTotal {
   return _formatNumber(_total);
  }

  handleError(String? error) {
    setBusy(false);
    
  }



  selectedIndexAt({required int index}) async {

    setBusy(true);
    await _rosterService.remove(actor: data!.actors[index], onError: handleError, onSuccess: () {
      setBusy(false);
    });
    
  }

  String titleAt({required int index}) {
    return data!.actors[index].name;
  }

  String descriptionAt({required int index}) {
    return _formatNumber(data!.actors[index].cost);
  }


  String _formatNumber(int value) {
    return NumberFormat.simpleCurrency(decimalDigits: 0).format(value);
  }

  

}