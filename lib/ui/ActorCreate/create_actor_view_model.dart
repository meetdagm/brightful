

import 'package:brightful/helpers/database_keys.dart';
import 'package:brightful/models/actor/actor.dart';
import 'package:brightful/models/actor/actor_serializer.dart';
import 'package:brightful/services/database_service.dart';
import 'package:brightful/services/locator.dart';
import 'package:brightful/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class CreateActorViewModel extends BaseViewModel {

  late Actor _model;
  static const _locale = 'en';
  final _controller = TextEditingController();
  final DatabaseService<Actor> _databaseService = DatabaseService(serializer: ActorSerializer(), collectionID: DatabaseKeys.actors);
  final NavigationService _navigationService = locator<NavigationService>();

  CreateActorViewModel({Actor? initialModel}) {
    _model = initialModel ?? Actor.empty(); //This line allows us to add editing capabilties in the future, if a model is passed in we can just use that and the same viewmodel to edit the users information
  }

  TextEditingController get rateController {
    return _controller;
  }

  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));

  add() async {
    setBusy(true);
    await _databaseService.create(object: _model, onError: _onError, onSuccess: () {
      setBusy(false);
      _navigationService.pop();
    });
  }

  String? validateName(String? value) {
    if (value == null || value == "") {
      return "Please enter the actors/actresses fullname";
    }
  }

  String? validateDescription(String? value) {
    if (value == null || value == "") {
      return "Please enter the actor's/actresse's bio";
    }
  }

  String? validateRate(String? value) {
    if (value == null || value == "") {
      return "Please enter the actor's rate.";
    }
  }

  setName(String? value) {
    if (value == null || value == "") return;
    _model.name = value;
  }

  setDescription(String? value) {
    if (value == null || value == "") return;
    _model.description = value;
  }

  _onError(String message) {
    setBusy(false);
  }

  rateChanged(String? value) {
    if (value == null || value == "") return;
    value = _formatNumber(value.replaceAll(',', ''));
    _controller.value = TextEditingValue(
      text: value, 
      selection: TextSelection.collapsed(offset: value.length)
    );
  }

  setRate(String? value) {
    if (value == null || value == "") return;
    value = value.replaceAll(',', '');
    _model.cost = int.parse(value);
  }

  

}