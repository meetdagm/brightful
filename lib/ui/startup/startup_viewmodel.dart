import 'package:brightful/services/auth_service.dart';
import 'package:brightful/services/locator.dart';
import 'package:brightful/ui/actorPreview/actor_collection_preview.dart';
import 'package:brightful/ui/components/root_layout.dart';
import 'package:brightful/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class StartupViewModel extends StreamViewModel<bool> {

  Widget _child =  RootLayout(child: loadingSpinner);
  final AuthService _authService = locator<AuthService>();

  @override
  Stream<bool> get stream => _authService.listenToAuthStateChanges();

  Widget get child {
    return _child;
  }

  @override
  onData(bool? data) {
    load();
    super.onData(data);
  }
  
  load() async {
    setBusy(true);
    if (data ?? false) {
      _child = const ActorCollectionPreview();
    } else {
      await _authService.createUser();
    }
    setBusy(false);
  
    notifyListeners();
  }
}
