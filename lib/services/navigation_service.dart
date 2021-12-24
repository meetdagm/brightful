
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavigationService {

  static final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  pop<T extends Object>([T? result]) {
   return _navigationKey.currentState?.pop(result);
  }

  navigateTo(Widget widget, {dynamic arguments}) async {
    return await _navigationKey.currentState?.push(MaterialPageRoute(builder: (builderContext) => widget));
  }

}