import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getIcon(String icon) => 'assets/icons/$icon.svg';
String getImage(String image) => 'assets/images/$image.png';

Color mainClr = const Color.fromRGBO(209, 195, 170, 1),
    altClr = Color(0xFF5F5D57),
    grey = Color(0xFF707070),
    red = Colors.red; //Color(0xFFB49866);

late SharedPreferences prefs;
late bool firstTime;
