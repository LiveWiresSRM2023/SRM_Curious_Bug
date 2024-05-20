import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srm_curious_bug/pages/auth.dart';
// import 'package:srm_curious_bug/pages/feed/create.dart';
// import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/feed.dart';
// import 'package:srm_curious_bug/pages/feed/sidebar.dart';
import 'package:srm_curious_bug/pages/landing.dart';
import 'package:srm_curious_bug/pages/onboard.dart';
import 'package:srm_curious_bug/pages/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/landing': (context) => const Landing(),
        '/auth': (context) => const Auth(),
        '/onboard': (context) => const OnBoard(),
        '/feed': (context) => const Feed(),
        // '/sidebar': (context) => const SideBar(),
        // '/events': (context) => const Events(),
        '/profile': (context) => const Profile(),
        // '/create': (context) => const Create(),
      },
    );
  }
}
