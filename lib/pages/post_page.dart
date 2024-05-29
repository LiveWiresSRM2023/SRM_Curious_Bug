// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:srm_curious_bug/widgets/appbar.dart';
import 'package:srm_curious_bug/widgets/gantt_chart.dart';

class PostPage extends StatefulWidget {
  final DocumentSnapshot post;
  final String documentID;
  const PostPage({super.key, required this.post, required this.documentID});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController commentController = TextEditingController();
  bool isUserJoined = false;
  // List events = []

  getEventsForProject(String id) {}

  @override
  void initState() {
    // getEventsForProject(widget.post.id);
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  List<String> _invites = [
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
    'Alice Brown',
  ];
  List<String> meet = [
    'Upcoming Meet',
    'Schedule Meet',
  ];
  void _acceptInvite(int index) {
    print('Accepted invite from ${_invites[index]}');
  }

  void _denyInvite(int index) {
    setState(() {
      _invites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: const Color(0xffF7F9FA),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        width: (MediaQuery.of(context).size.width * 0.7) - 16,
                        height: MediaQuery.of(context).size.height - 56,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 25, right: 0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(widget
                                                    .post["op_profile"]))),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.post["op_name"],
                                              style: GoogleFonts.archivo(
                                                  textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black))),
                                          const SizedBox(width: 15),
                                          Text(widget.post["op_email"],
                                              style: GoogleFonts.archivo(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey))),
                                          Text(
                                              "● ${DateTime.now().difference(DateTime.parse(widget.post["timestamp"])).inDays}D",
                                              style: GoogleFonts.archivo(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey))),
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        hoverColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                                  const SizedBox(height: 5),
                                  ReadMoreText(widget.post["title"],
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
                                  const SizedBox(height: 5),
                                  ReadMoreText(widget.post["post"],
                                      textAlign: TextAlign.start,
                                      trimLines: 5,
                                      trimCollapsedText: ' Show More',
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ))),
                                  const SizedBox(height: 10),
                                  widget.post["post_images"].length > 0
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 500,
                                              height: 200,
                                              child: CarouselSlider(
                                                  items: List.generate(
                                                      widget.post["post_images"]
                                                          .length,
                                                      (imageIndex) => Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: NetworkImage(
                                                                        widget.post["post_images"]
                                                                            [
                                                                            imageIndex]))),
                                                          )),
                                                  options: CarouselOptions(
                                                      autoPlay: false,
                                                      height: 200,
                                                      enlargeCenterPage: true)),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        ),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            //TODO: Implement firestore update
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.keyboard_arrow_up_rounded,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                        Text(widget.post["upvote"].toString()),
                                        InkWell(
                                          onTap: () {
                                            // TODO: Implement firestore update
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.messenger_outline,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        Text(widget.post["n_comments"]
                                            .toString()),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.ios_share,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        const Text("Share")
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            widget.post["hashtags"].length,
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
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                    widget.post["hashtags"]
                                                        [index],
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.archivo(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black))),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Discussion",
                                    style: GoogleFonts.archivo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(8),
                                    //     border: Border.all(
                                    //         color: Theme.of(context)
                                    //             .colorScheme
                                    //             .secondary)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 36,
                                              width: 36,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .photoURL!))),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4),
                                              child: VerticalDivider(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 212, 208, 208)),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: SizedBox(
                                                  width: 640,
                                                  height: 30,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: TextField(
                                                      controller:
                                                          commentController,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'Add a comment...',
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection("posts")
                                                      .doc(widget.documentID)
                                                      .collection("comments")
                                                      .doc()
                                                      .set({
                                                    "comment":
                                                        commentController.text,
                                                    "date": DateTime.now().day,
                                                    "month":
                                                        DateTime.now().month,
                                                    "year": DateTime.now().year,
                                                  });
                                                  FirebaseFirestore.instance
                                                      .collection("posts")
                                                      .doc(widget.documentID)
                                                      .update({
                                                    "n_comments": widget.post[
                                                            "n_comments"] +
                                                        1
                                                  });
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStateProperty.all(
                                                            Colors.black),
                                                    shape: WidgetStateProperty.all(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                                child: Text(
                                                  "Add",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                ]),
                          ),
                        ),
                      ),
                      FirebaseAuth.instance.currentUser!.email! ==
                              widget.post["op_email"]
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, top: 0, bottom: 0),
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width * 0.30) -
                                        8,
                                height: MediaQuery.of(context).size.height - 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Timeline",
                                          style: GoogleFonts.archivo(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.7),
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.white30,
                                              ),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Colors.white60,
                                                    Colors.white30
                                                  ]),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const GanttChart(),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Meetings",
                                          style: GoogleFonts.archivo(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 240,
                                                child: Text(
                                                  "Meeting from Monday to Saturday. 3PM - 4PM",
                                                  style: GoogleFonts.inter(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              const Spacer(
                                                  // width: 5,
                                                  ),
                                              TextButton(
                                                onPressed: () {},
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStateProperty.all(
                                                            Colors.black),
                                                    shape: WidgetStateProperty.all(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                    fixedSize:
                                                        WidgetStateProperty.all(
                                                            const Size(
                                                                100, 30))),
                                                child: Text(
                                                  "Join",
                                                  style: GoogleFonts.inter(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // use if else condition to display schedule meeting or join meeting
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: TextButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primary),
                                                shape: WidgetStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                fixedSize:
                                                    WidgetStateProperty.all(Size(
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                        30))),
                                            child: Text(
                                              "Schedule a new meeting",
                                              style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Collaboration requests",
                                          style: GoogleFonts.archivo(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            height: 300,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: ListView.separated(
                                                itemCount: _invites.length,
                                                separatorBuilder: (context,
                                                        index) =>
                                                    const Divider(height: 5),
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    leading: CircleAvatar(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      child: Text(
                                                          _invites[index][0]),
                                                    ),
                                                    title: Text(_invites[index],
                                                        style: GoogleFonts.inter(
                                                            textStyle: const TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                                    subtitle: InkWell(
                                                      onTap: () {},
                                                      child: Text('Invite + ',
                                                          style: GoogleFonts.inter(
                                                              textStyle: const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal))),
                                                    ),
                                                    trailing: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(
                                                              Icons.check,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary),
                                                          onPressed: () {
                                                            _acceptInvite(
                                                                index);
                                                          },
                                                        ),
                                                        IconButton(
                                                          icon: const Icon(
                                                              Icons.close),
                                                          onPressed: () {
                                                            _denyInvite(index);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/post.png")),
                                  color:
                                      const Color.fromARGB(255, 201, 200, 200),
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height - 56,
                              child: Center(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200
                                              .withOpacity(0.5),
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white30,
                                          ),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.white60,
                                                Colors.white30
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      height:
                                          MediaQuery.of(context).size.height -
                                              56,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/icons/padlock.png",
                                              height: 120,
                                              width: 120),
                                          const SizedBox(height: 40),
                                          Text(
                                              "Be The Missing Piece\nRequest to join, contribute and collaborate",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.archivo(
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black))),
                                          const SizedBox(height: 10),
                                          InkWell(
                                            onTap: () {},
                                            splashColor:
                                                Colors.white.withOpacity(0.9),
                                            highlightColor: Colors.transparent,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xffDe9a3a),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "JOIN",
                                                    style: GoogleFonts.archivo(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))))
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
