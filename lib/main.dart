import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shoeherd/constants.dart';
import 'package:smart_shoeherd/controllers/image_controller.dart';
import 'package:smart_shoeherd/controllers/permissions_controller.dart';
import 'package:smart_shoeherd/controllers/type_classification_controller.dart';
import 'package:smart_shoeherd/screens/sheep_screen.dart';
import 'package:smart_shoeherd/screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  firstTime = prefs.getBool('firstTime') ?? true;
  runApp(
    const SheepApp(),
  );
}

class SheepApp extends StatelessWidget {
  const SheepApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PermissionsController>(
          create: (context) => PermissionsController(),
        ),
        ChangeNotifierProvider<ImageController>(
          create: (context) => ImageController(),
        ),
        ChangeNotifierProvider<TypeClassificationController>(
          create: (context) => TypeClassificationController(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Segoe UI'
          ),
          home: firstTime ? const StartScreen() : const SheepScreen(),
        );
      },
    );
  }
}
