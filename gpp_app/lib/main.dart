import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpp_app/views/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      title: 'Home',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
