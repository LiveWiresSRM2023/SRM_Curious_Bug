import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/pages/feed/mini_profile.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/posts.dart';
import 'package:srm_curious_bug/widgets/custom_textfield.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 1,
            child: MiniProfile(),
          ),
          const VerticalDivider(
            color: Color(0xffdcdcdc),
            width: 1,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            borderColor: Theme.of(context).colorScheme.primary,
                            width: double.maxFinite,
                            labelText: "Search",
                            leadingIcon: const Icon(Icons.search),
                            showLabel: false),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/srm_logo.png",
                                width: 50, height: 50),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Whats's on your mind?",
                              style: GoogleFonts.archivo(
                                  fontSize: 20, color: const Color(0xff5B7083)),
                            )
                          ],
                        ),
                        Row(
                          
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 160,
                      child: const Post(
                        posts: [1, 2, 3, 5, 6],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(
            color: Color(0xffdcdcdc),
            width: 1,
          ),
          const Expanded(
            flex: 1,
            child: Events(),
          )
        ],
      ),
    );
  }
}
