// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/pages/feed/create.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/posts.dart';
import 'package:srm_curious_bug/pages/feed/sidebar.dart';
import 'package:srm_curious_bug/pages/profile.dart';
import 'package:srm_curious_bug/widgets/custom_textfield.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List posts = [
    {
      "title": "Sample project",
      "upvote": "10",
      "post": "Automating legal document analysis with Python libraries",
      "timestamp": "2024-03-28T22:33:00+05:30",
      "op_name": "Data Analyst",
      "n_comments": 5,
      "hashtags": ["legaltech", "python", "nlp"],
      "op_email": "data.analyst@yourcompany.com",
      "op_profile":
          "https://srmeureka.pages.dev/assets/assets/images/srm_logo.png",
      "comments": "/collection/{docID}",
      "post_images": [
        "https://picsum.photos/600/300",
        "https://picsum.photos/600/300"
      ],
      "duration": "1 month",
      "expertise": ["Python", "Natural Language Processing (NLP)"]
    },
    {
      "title": "Sample project",
      "upvote": "10",
      "post": "Open-source legal case management tools - Seeking ML engineers",
      "timestamp": "2024-03-28T22:33:00+05:30",
      "op_name": "Law Firm Manager",
      "n_comments": 1,
      "hashtags": ["opensource", "legaltech", "law", "linux"],
      "op_email": "manager@lawfirm.com",
      "op_profile":
          "https://srmeureka.pages.dev/assets/assets/images/srm_logo.png",
      "comments": "/collection/{docID}",
      "post_images": [
        "https://picsum.photos/600/300",
        "https://picsum.photos/600/300"
      ],
      "duration": "3 months",
      "expertise": ["Law", "Open Source Software (OSS)"]
    },
    {
      "title": "Sample project",
      "upvote": "10",
      "post":
          "Visualizing legal data trends: Exploring Python libraries for data analysis",
      "timestamp": "2024-03-28T22:33:00+05:30",
      "op_name": "Data Scientist",
      "n_comments": 3,
      "hashtags": ["law", "datavisualization", "python"],
      "op_email": "data.scientist@yourcompany.com",
      "op_profile":
          "https://srmeureka.pages.dev/assets/assets/images/srm_logo.png",
      "comments": "/collection/{docID}",
      "post_images": [
        "https://picsum.photos/600/300",
        "https://picsum.photos/600/300"
      ],
      "duration": "2 weeks",
      "expertise": ["Python", "Data Visualization"]
    }
  ];

  @override
  Widget build(BuildContext context) {
    //bool collaborationSwitch = false;
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              //flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width * 0.075,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          CustomTextField(
                              borderColor:
                                  Theme.of(context).colorScheme.primary,
                              width: double.maxFinite,
                              labelText: "Search",
                              leadingIcon: const Icon(Icons.search),
                              showLabel: false),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 8),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: FloatingActionButton.extended(
                        label: Text("Create +",
                            style: GoogleFonts.inter(color: Colors.white)),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // List images = [];
                                // bool mediaUploaded = false;
                                // List<String> mediaUrl = [];
                                return const Create();
                              });
                        },
                        //mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        // icon: const Icon(Icons.add),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.008),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/icons/notification 1.png",
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.008),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/icons/discussion.png",
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const Profile(),
                            transitionDuration: const Duration(seconds: 1),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.06,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              shape: BoxShape.circle,
                              color: Colors.black45,
                            ),
                            // child: ClipOval(
                            //   child: Image.asset(
                            //     "assets/images/bluebells.jpg",
                            //     width: MediaQuery.of(context).size.width * 0.02,
                            //     height:
                            //         MediaQuery.of(context).size.height * 0.02,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.02,
                            child: const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffdcdcdc),
              height: 1,
            ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 110,
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
