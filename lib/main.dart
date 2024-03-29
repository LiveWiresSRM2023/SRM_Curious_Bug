import 'package:flutter/material.dart';
import 'package:srm_curious_bug/pages/feed/feed.dart';
import 'package:srm_curious_bug/pages/auth.dart';
import 'package:srm_curious_bug/pages/profile.dart';

void main() {
  //add this
  runApp(const MyApp());
}

//using stateless widget here.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SRM CURIOUS BUG',
      debugShowCheckedModeBanner: false,
      home: const Feed(), // replace this with Auth()
      routes: {
        '/auth': (context) => const Auth(),
        '/profile': (context) => const Profile(),
        '/feed': (context) => const Feed()
        
      },
    );
  }
}
