import 'package:demo_project/pages/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyD3L6Beqys2PXfk0VEp7Jed3icbIbh_lYk", appId: "1:128413889201:web:cf15783197ee7f5bcce890", messagingSenderId: "G-69TPDHK29C", projectId: "ontryapp-45ac6"));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}