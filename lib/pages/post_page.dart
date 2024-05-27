// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/sidebar.dart';
import 'package:srm_curious_bug/widgets/appbar.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool loadingPosts = true;
  List posts = [];

  Future<void> getAllPosts() async {
    await FirebaseFirestore.instance
        .collection("posts")
        .get()
        .then((QuerySnapshot doc) {
      posts.addAll(doc.docs);
    });

    setState(() {
      loadingPosts = false;
    });
    print(posts);
  }

  Map<String, String> userInfo = {
    "name": "AlexJob A",
    "title": "UI/UX Designer",
    "mail": "alex@123",
    "duration": "1hr"
  };
  Map<String, String> counts = {
    "vote": "6.2k",
    "comments": "80",
    "share": "61"
  };
  List<String> hashtags = [
    "UXDesign",
    "mypost",
    "DataScience",
    "MachineLearning"
  ];

  @override
  void initState() {
    getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  //post page.............................................
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height - 56,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 15, right: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/post.png"))),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(userInfo["name"]!,
                                              style: GoogleFonts.archivo(
                                                  textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black))),
                                          const SizedBox(width: 15),
                                          Text(userInfo["mail"]!,
                                              style: GoogleFonts.archivo(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey))),
                                        ],
                                      ),
                                      Text(userInfo["title"]!,
                                          style: GoogleFonts.archivo(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black))),
                                      Text("● ${userInfo["duration"]!}",
                                          style: GoogleFonts.archivo(
                                              textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.grey))),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    hoverColor:
                                        Theme.of(context).colorScheme.primary,
                                    splashColor: Colors.transparent,
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_horiz,
                                        size: 17, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text("Title of the post:",
                                  style: GoogleFonts.archivo(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))),
                              const SizedBox(height: 8),
                              ReadMoreText(
                                  "My passion lies in crafting user interfaces and experiences (UI/UX design) that make lives easier.",
                                  textAlign: TextAlign.start,
                                  trimLines: 2,
                                  trimCollapsedText: ' Show More',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ))),
                              const SizedBox(height: 10),
                              Text("Abstract:",
                                  style: GoogleFonts.archivo(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))),
                              const SizedBox(height: 8),
                              ReadMoreText(
                                  "But after work, a world of inspiration awaits! Church grounds me, offering peace and purpose. Then, I unleash creativity through epic guitar jams, filling my world with music and good vibes. But after work, a world of inspiration awaits! Church grounds me, offering peace and purpose. Then, I unleash creativity through epic guitar jams, filling my world with music and good vibes. ",
                                  textAlign: TextAlign.start,
                                  trimLines: 5,
                                  trimCollapsedText: ' Show More',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ))),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                height: 300,
                                child: Center(
                                  child: ListView.builder(
                                    itemCount: 2,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/post.png")),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/upvote.png",
                                    height: 14,
                                    width: 14,
                                  ),
                                  Text(counts["vote"]!,
                                      style: GoogleFonts.archivo(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary))),
                                  Image.asset(
                                    "assets/icons/downvote.png",
                                    height: 14,
                                    width: 14,
                                  ),
                                  const SizedBox(width: 20),
                                  Image.asset(
                                    "assets/icons/chat_icon.png",
                                    height: 14,
                                    width: 14,
                                  ),
                                  Text(counts["comments"]!,
                                      style: GoogleFonts.archivo(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary))),
                                  const SizedBox(width: 20),
                                  Image.asset(
                                    "assets/icons/share_icon_black.png",
                                    height: 14,
                                    width: 14,
                                  ),
                                  Text(counts["share"]!,
                                      style: GoogleFonts.archivo(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary))),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: hashtags.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(hashtags[index],
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.archivo(
                                                    textStyle: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black))),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/images/post.png"))),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 4.0, bottom: 4),
                                          child: VerticalDivider(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 212, 208, 208)),
                                        ),
                                        SizedBox(
                                            width: 480,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, top: 7),
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,

                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10.0),
                                                  hintText: 'Add a comment...',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),

                                                  // fillColor: Colors
                                                  //     .transparent,
                                                  // filled:
                                                  //     true,
                                                ),
                                                maxLines: 2,
                                                textAlign: TextAlign.left,
                                              ),
                                            )),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            "assets/icons/smiley_imogi.png",
                                            height: 16,
                                            width: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            "assets/icons/gallery-add.png",
                                            height: 16,
                                            width: 16,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              const SizedBox(height: 15),
                            ]),
                      ),
                    ),
                  ),
                  //end of post page................................
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
