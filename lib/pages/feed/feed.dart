import 'package:flutter/material.dart';
import 'package:srm_curious_bug/pages/feed/mini_profile.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: MiniProfile(),
            ),
          ),
          const VerticalDivider(
            color: Color(0xffdcdcdc),
            width: 1,
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
              child: ,
            ),
          ),
          const VerticalDivider(
            color: Color(0xffdcdcdc),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
