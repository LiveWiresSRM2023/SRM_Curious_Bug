// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:srm_curious_bug/widgets/appbar.dart';

class PostPage extends StatefulWidget {
  final DocumentSnapshot post;
  final String documentID;
  const PostPage({super.key, required this.post, required this.documentID});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    // TODO: implement dispose
    super.dispose();
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Expanded(
                      //   flex: 1,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: SideBar(),
                      //   ),
                      // ),
                      // const VerticalDivider(
                      //   color: Color(0xffdcdcdc),
                      //   width: 1,
                      // ),
                      //post page.............................................
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .photoURL!))),
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
                                                height: 40,
                                                child: TextField(
                                                  controller: commentController,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color:
                                                                        Colors
                                                                            .black),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color:
                                                                        Colors
                                                                            .black),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),

                                                    contentPadding:
                                                        const EdgeInsets.all(5),
                                                    hintText:
                                                        'Add a comment...',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey),

                                                    // fillColor: Colors
                                                    //     .transparent,
                                                    // filled:
                                                    //     true,
                                                  ),
                                                  maxLines: 4,
                                                  textAlign: TextAlign.justify,
                                                )),
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
                                                    "comment": commentController.text,
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
                      //end of post page................................
                      // const VerticalDivider(
                      //   color: Color(0xffdcdcdc),
                      //   width: 1,
                      // ),
                      // const Expanded(
                      //   flex: 1,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Events(),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
