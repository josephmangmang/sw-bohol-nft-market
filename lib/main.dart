import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Market',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        textTheme: ThemeData
            .dark()
            .textTheme
            .apply(fontFamily: 'SFProDisplay'),
      ),
      home: HomePage(),
    );
  }
}
