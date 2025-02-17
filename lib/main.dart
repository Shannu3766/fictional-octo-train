import 'package:firebase_dart/core.dart' as firebase_dart;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vidhya/screens/Entryscreen.dart';
import 'package:vidhya/screens/home.dart';
import 'package:vidhya/screens/lessonscreen.dart';
import 'package:vidhya/screens/registration.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // HomeScreen()
          // RegistrationScreen()
          // HomeScreen(),
          // LessonScreen()
          Entryscreen()
    );
    // );
  }
}
