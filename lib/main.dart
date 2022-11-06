import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app_config/app_config.dart';
import 'firebase_option.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(

  );
 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistrationScreen(),
    );
  }
}