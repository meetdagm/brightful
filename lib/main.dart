import 'package:brightful/services/locator.dart';
import 'package:brightful/services/navigation_service.dart';
import 'package:brightful/ui/startup/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brightful',
      theme: ThemeData(
        splashColor: Colors.transparent,
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: const StartupView(),
    );
  }
}
