import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srm_curious_bug/pages/auth.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/feed.dart';
import 'package:srm_curious_bug/pages/feed/mini_profile.dart';
import 'package:srm_curious_bug/pages/profile.dart';

void main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDpPLA4Nt1FY6hsoseVPYD2JRP7e9ENKD4",
          authDomain: "srm-timetable-bb661.firebaseapp.com",
          projectId: "srm-timetable-bb661",
          storageBucket: "srm-timetable-bb661.appspot.com",
          messagingSenderId: "1062574904489",
          appId: "1:1062574904489:web:46160ce4a3c6c9bf6485b8",
          measurementId: "G-008T9SX14L"));
  runApp(const MyApp());
}

//using stateless widget here.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SRM EUREKA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff0c4da2),
          secondary: const Color(0xffa8cbf6),
          tertiary: const Color(0xffe4b316),
        ),
        useMaterial3: true,
      ),
      home: const Feed(),
      routes: {
        '/auth': (context) => const Auth(),
        '/profile': (context) => const Profile(),
        '/feed': (context) => const Feed(),
        '/mini_profile': (context) => const MiniProfile(),
        '/events': (context) => const Events(),
      },
    );
  }
}
