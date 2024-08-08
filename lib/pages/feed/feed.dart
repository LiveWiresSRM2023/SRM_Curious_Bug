// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/posts.dart';
import 'package:srm_curious_bug/pages/feed/sidebar.dart';
import 'package:srm_curious_bug/pages/profile.dart';
import 'package:srm_curious_bug/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:srm_curious_bug/widgets/post_dialog.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  TextEditingController titleController = TextEditingController();
  TextEditingController abstractController = TextEditingController();
  TextEditingController invitesController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  bool loadingPosts = true;

  List posts = [];

  getAllPosts() async {
    posts = [];
    await FirebaseFirestore.instance
        .collection("posts")
        .get()
        .then((QuerySnapshot docs) {
      for (var doc in docs.docs) {
        posts.add({
          "id": doc.id,
          "collaborator": doc.get("collaborator"),
          "duration": doc.get("duration"),
          "expertise": doc.get("expertise"),
          "hashtags": doc.get("hashtags"),
          "meetingDetails": doc.get("meetingDetails"),
          "meetingLink": doc.get("meetingLink"),
          "n_comments": doc.get("n_comments"),
          "op_email": doc.get("op_email"),
          "op_name": doc.get("op_name"),
          "op_profile": doc.get("op_profile"),
          "post": doc.get("post"),
          "post_images": doc.get("post_images"),
          "timestamp": doc.get("timestamp"),
          "title": doc.get("title"),
          "upvote": doc.get("upvote")
        });
      }
    });

    setState(() {
      loadingPosts = false;
    });
  }

  @override
  void initState() {
    getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //bool collaborationSwitch = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/feed');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"))),
            ),
          ),
        ),
        centerTitle: true,
        title: SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.45,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              labelText: "Search",
              suffixIcon: SizedBox(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         // Icon(Icons.sort,
                    //         //     color: Theme.of(context).colorScheme.primary),
                    //         DropdownButtonHideUnderline(
                    //           child: DropdownButton<String>(
                    //             icon: Padding(
                    //               padding: const EdgeInsets.only(left: 1),
                    //               child: Icon(Icons.sort,
                    //                   color:
                    //                       Theme.of(context).colorScheme.secondary),
                    //             ),
                    //             iconSize: 20,
                    //             elevation: 10,
                    //             style: GoogleFonts.inter(
                    //                 textStyle:
                    //                     const TextStyle(color: Colors.black)),
                    //             dropdownColor: Colors.grey[200],
                    //             hint: Text('filter',
                    //                 style: GoogleFonts.inter(
                    //                   textStyle: TextStyle(
                    //                       fontWeight: FontWeight.w500,
                    //                       color: Theme.of(context)
                    //                           .colorScheme
                    //                           .secondary),
                    //                 )),
                    //             value: null, // Initially selected value or null
                    //             onChanged: (String? newValue) {
                    //               // Handle dropdown value change
                    //             },
                    //             items: filterNames.map((String value) {
                    //               return DropdownMenuItem<String>(
                    //                 value: value,
                    //                 child: Text(
                    //                   value,
                    //                   style: GoogleFonts.inter(
                    //                       textStyle: const TextStyle(fontSize: 16)),
                    //                 ),
                    //               );
                    //             }).toList(),
                    //           ),
                    //         ),
                    //       ]),
                    // ),
                    IconButton(
                        onPressed: () async {
                          http.Response res = await http.post(
                              Uri.parse("$url/post"),
                              body: jsonEncode({
                                "user_id": "123",
                                "type": "search",
                                "content": searchController.text,
                                "id": ""
                              }));
                          print(res);
                          //TODO: implement posts list update
                        },
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.primary,
                        ))
                  ],
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              postDialog(context);
              await getAllPosts();
            },
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                fixedSize: WidgetStateProperty.all(const Size(100, 30))),
            child: Text(
              "Create +",
              style: GoogleFonts.inter(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {},
            child: Image.asset("assets/icons/bell.png", height: 30, width: 30),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {},
            child:
                Image.asset("assets/icons/message.png", height: 30, width: 30),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Profile(user: "123")));
              // Navigator.pushNamed(context, '/profile');
            },
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser!.photoURL!)),
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffF7F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SideBar(),
                    ),
                  ),
                  const VerticalDivider(
                    color: Color(0xffdcdcdc),
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: loadingPosts
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Loading posts",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 56,
                                  child: Post(
                                    posts: posts,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  const VerticalDivider(
                    color: Color(0xffdcdcdc),
                    width: 1,
                  ),
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Events(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HashTagWidget1 extends StatelessWidget {
  final String tag;

  const HashTagWidget1(this.tag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 214, 193, 121),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          tag,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
