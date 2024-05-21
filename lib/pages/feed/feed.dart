// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/posts.dart';
import 'package:srm_curious_bug/pages/feed/sidebar.dart';
import 'package:srm_curious_bug/widgets/appbar.dart';

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
  bool loadingPosts = true;

  List posts = [
    // {
    //   "title": "Sample project",
    //   "upvote": "10",
    //   "post": "Automating legal document analysis with Python libraries",
    //   "timestamp": "2024-03-28T22:33:00+05:30",
    //   "op_name": "Data Analyst",
    //   "n_comments": 5,
    //   "hashtags": ["legaltech", "python", "nlp"],
    //   "op_email": "data.analyst@yourcompany.com",
    //   "op_profile":
    //       "https://srmeureka.pages.dev/assets/assets/images/srm_logo.png",
    //   "comments": "/collection/{docID}",
    //   "post_images": [
    //     "https://picsum.photos/600/300",
    //     "https://picsum.photos/600/300"
    //   ],
    //   "duration": "1 month",
    //   "expertise": ["Python", "Natural Language Processing (NLP)"]
    // },
    // {
    //   "title": "Sample project",
    //   "upvote": "10",
    //   "post": "Open-source legal case management tools - Seeking ML engineers",
    //   "timestamp": "2024-03-28T22:33:00+05:30",
    //   "op_name": "Law Firm Manager",
    //   "n_comments": 1,
    //   "hashtags": ["opensource", "legaltech", "law", "linux"],
    //   "op_email": "manager@lawfirm.com",
    //   "op_profile":
    //       "https://srmeureka.pages.dev/assets/assets/images/srm_logo.png",
    //   "comments": "/collection/{docID}",
    //   "post_images": [
    //     "https://picsum.photos/600/300",
    //     "https://picsum.photos/600/300"
    //   ],
    //   "duration": "3 months",
    //   "expertise": ["Law", "Open Source Software (OSS)"]
    // },
    // {
    //   "title": "Sample project",
    //   "upvote": "10",
    //   "post":
    //       "Visualizing legal data trends: Exploring Python libraries for data analysis",
    //   "timestamp": "2024-03-28T22:33:00+05:30",
    //   "op_name": "Data Scientist",
    //   "n_comments": 3,
    //   "hashtags": ["law", "datavisualization", "python"],
    //   "op_email": "data.scientist@yourcompany.com",
    //   "op_profile":
    //       "https://srmeureka.pages.dev/assets/assets/images/srm_logo.png",
    //   "comments": "/collection/{docID}",
    //   "post_images": [
    //     "https://picsum.photos/600/300",
    //     "https://picsum.photos/600/300"
    //   ],
    //   "duration": "2 weeks",
    //   "expertise": ["Python", "Data Visualization"]
    // }
  ];

  Future<void> getAllPosts() async {
    await FirebaseFirestore.instance
        .collection("posts")
        .get()
        .then((QuerySnapshot doc) {
      posts.addAll(doc.docs);
      // doc.docs.map((e) => posts.add({
      //       "title": e.get("posts"),
      //       "upvote": e.get("upvote").toString(),
      //       "post": e.get("posts"),
      //       "timestamp": "2024-03-28T22:33:00+05:30",
      //       "op_name": "Data Analyst",
      //       "n_comments": e.get("n_comments"),
      //       "hashtags": e.get("hashtags"),
      //       "op_email": e.get("op_email"),
      //       "op_profile":
      //           "https://srmeureka.pages.dev/assets/assets/images/srm_logo.png",
      //       "comments": "/collection/{docID}",
      //       "post_images": [
      //         "https://picsum.photos/600/300",
      //         "https://picsum.photos/600/300"
      //       ],
      //       "duration": "1 month",
      //       "expertise": ["Python", "Natural Language Processing (NLP)"]
      //     }));
    });

    setState(() {
      loadingPosts = false;
    });
    print(posts);
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
      appBar: appBar(context),
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
