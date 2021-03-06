import 'package:camera/camera.dart';
import 'package:chat/pages/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'pages/camera/camera_screen.dart';
import 'pages/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E),
      ),
      home: LoginScreen(),
    );
  }
}
