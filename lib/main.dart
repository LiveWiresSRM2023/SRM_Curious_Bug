import 'package:flutter/material.dart';
import 'package:srm_curious_bug/pages/auth.dart';
import 'package:srm_curious_bug/pages/feed/feed.dart';
import 'package:srm_curious_bug/pages/feed/mini_profile.dart';
import 'package:srm_curious_bug/pages/profile.dart';

void main() {
  //add this
  runApp(const MyApp());
}

//using stateless widget here.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SRM CURIOUS BUG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff0c4da2),
          secondary: const Color(0xffa8cbf6),
          tertiary: const Color(0xffe4b316),
        ),
        useMaterial3: true,
      ),
      home: const MiniProfile(),
      routes: {
        '/auth': (context) => const Auth(),
        '/profile': (context) => const Profile(),
        '/feed': (context) => const Feed(),
        '/mini_profile': (context) => const MiniProfile(),
      },
    );
  }
}
