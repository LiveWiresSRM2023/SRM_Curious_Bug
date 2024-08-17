import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srm_curious_bug/pages/auth.dart';
import 'package:srm_curious_bug/pages/feed/feed.dart';
import 'package:srm_curious_bug/pages/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDfwvKwQtzfNMBtBIlgwt6T0MXwzCEoy1E",
          authDomain: "curious-bees.firebaseapp.com",
          projectId: "curious-bees",
          storageBucket: "curious-bees.appspot.com",
          messagingSenderId: "162041400363",
          appId: "1:162041400363:web:12fcd65657d13221df2e6e",
          measurementId: "G-XH1B1Z3VVP"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SRM Curious Bees',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xffDe9a3a),
          secondary: const Color(0xff6c6c6c),
          tertiary: const Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
      ),
      home: const Auth(),
      routes: {
        // '/landing': (context) => const Landing(),
        '/auth': (context) => const Auth(),
        '/onboard': (context) => const OnBoard(),
        '/feed': (context) => const Feed(),
        // '/profile': (context) => const Profile(),
      },
    );
  }
}
