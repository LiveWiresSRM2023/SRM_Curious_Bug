import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srm_curious_bug/pages/post_page.dart';
import 'package:srm_curious_bug/widgets/editProfile.dart';
import 'package:srm_curious_bug/widgets/post_dialog.dart';

class Profile extends StatefulWidget {
  final String? email;
  const Profile({this.email, super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String about = '';
  String email = '';
  // String position = '';
  // String degree = '';
  // String department = '';
  // String website = '';
  List activity = [];
  bool showMore = false;
  List interests = [];
  Map profileInto = {};

  void loadProfileDetails() async {
    print(widget.email);
    if (widget.email == null) {
      print("has no email");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      name = prefs.getString("name")!;
      about = prefs.getString("about")!;
      interests = prefs.getStringList("interests")!;
      email = FirebaseAuth.instance.currentUser!.email!;
      profileInto["Position"] = prefs.getString("position");
      profileInto["Degree"] = prefs.getString("degree");
      profileInto["Department"] = prefs.getString("department");
      // profileInto["Website"] = prefs.getString("website");
    } else {
      print("has email");
      await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.email)
          .get()
          .then((doc) {
        name = doc.get("name");
        about = doc.get("about");
        interests = doc.get("interests");
        email = doc.get("email");
        profileInto["Position"] = doc.get("position");
        profileInto["Degree"] = doc.get("degree");
        profileInto["Department"] = doc.get("department");
        // profileInto["Website"] = doc.get("website");
      });
    }
    setState(() {});
  }

  void loadActivityFromDB() async {
    activity = [];
    await FirebaseFirestore.instance
        .collection("posts")
        .where("op_email",
            isEqualTo: FirebaseAuth.instance.currentUser!.email.toString())
        .limit(5)
        .get()
        .then((docs) {
      for (var doc in docs.docs) {
        activity.add({
          "id": doc.id,
          "title": doc.get("title"),
          "post": doc.get("post"),
          "photo": doc.get("post_images"),
          "upvote": doc.get("upvote"),
          "n_comments": doc.get("n_comments")
        });
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    loadProfileDetails();
    loadActivityFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List> userProfiles = {
      "Alex Job A": ["UI/UX Designer", "assets/images/pfp.jpg"],
      "Roshan SK": ["Software Developer", "assets/images/pfp.jpg"],
      "Sudharshan": ["UI/UX Developer", "assets/images/pfp.jpg"],
      "Abin": ["Data Scientist", "assets/images/pfp.jpg"],
    };

    // List contactImages = [
    //   "assets/icons/googlescholar.png",
    //   "assets/icons/researchgate.png",
    //   "assets/icons/twitter.png",
    //   "assets/icons/gmail.png",
    //   "assets/icons/github.png",
    // ];

    Map contactImages = {
      "assets/icons/googlescholar.png": "www.google.com",
      "assets/icons/researchgate.png": "www.google.com",
      "assets/icons/twitter.png": "www.google.com",
      "assets/icons/gmail.png": "www.google.com",
      "assets/icons/github.png": "www.google.com",
    };

    return Scaffold(
      // appBar: appBar(context),
      backgroundColor: const Color.fromARGB(255, 223, 218, 218),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      // image: DecorationImage(image: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!))
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .photoURL!))),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    // width: 160,
                                                    child: Text(
                                                      FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .displayName!,
                                                      style: GoogleFonts.inter(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${profileInto["Position"]} at ${profileInto["Department"]}",
                                                  style: GoogleFonts.inter(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  "Summary",
                                                  style: GoogleFonts.archivo(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                const Divider(
                                                  color: Colors.black,
                                                  thickness: 1,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      profileInto.length,
                                                      (index) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        4.0),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    children: [
                                                                  TextSpan(
                                                                      text:
                                                                          "${profileInto.keys.toList()[index]} : ",
                                                                      style: GoogleFonts.inter(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  TextSpan(
                                                                      text:
                                                                          "${profileInto.values.toList()[index]}",
                                                                      style: GoogleFonts
                                                                          .inter(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            15,
                                                                        // fontWeight: FontWeight.bold
                                                                      )),
                                                                ])),
                                                          )),
                                                ),
                                                const Divider(
                                                  color: Colors.black,
                                                  thickness: 2,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: List.generate(
                                                      contactImages.length,
                                                      (index) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        4.0),
                                                            child: InkWell(
                                                              onTap: () {},
                                                              child:
                                                                  Image.asset(
                                                                contactImages
                                                                        .keys
                                                                        .toList()[
                                                                    index],
                                                                height: 30,
                                                                width: 30,
                                                              ),
                                                            ),
                                                          )),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    editProfile(context);
                                                    loadProfileDetails();
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStateProperty
                                                              .all(
                                                                  Colors.black),
                                                      shape: WidgetStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                      fixedSize:
                                                          WidgetStateProperty
                                                              .all(const Size(
                                                                  100, 30))),
                                                  child: Text(
                                                    "Edit Profile",
                                                    style: GoogleFonts.inter(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(5.0),
                                      //   child: Stack(
                                      //     children: [
                                      //       Container(
                                      //         height: MediaQuery.of(context)
                                      //                 .size
                                      //                 .height *
                                      //             0.45,
                                      //         width: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width *
                                      //             0.9,
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(8),
                                      //             image: const DecorationImage(
                                      //                 image: AssetImage(
                                      //                     "assets/images/Rectangle 14.png"),
                                      //                 fit: BoxFit.fitWidth)),
                                      //       ),
                                      //       const Positioned(
                                      //         bottom: 1,
                                      //         left: 25,
                                      //         child: CircleAvatar(
                                      //             backgroundColor: Colors.white,
                                      //             radius: 36,
                                      //             backgroundImage: AssetImage(
                                      //                 "assets/images/pfp.jpg")),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.center,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: [
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Column(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.center,
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           Row(
                                      //             children: [
                                      //               Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.all(
                                      //                         2.0),
                                      //                 child: Text("Alex Job",
                                      //                     style:
                                      //                         GoogleFonts.inter(
                                      //                             textStyle:
                                      //                                 const TextStyle(
                                      //                       fontSize: 15,
                                      //                       fontWeight:
                                      //                           FontWeight.bold,
                                      //                       color: Colors.black,
                                      //                     ))),
                                      //               ),
                                      //               Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.all(
                                      //                         2.0),
                                      //                 child: Text("@alexjob145",
                                      //                     style:
                                      //                         GoogleFonts.inter(
                                      //                             textStyle:
                                      //                                 TextStyle(
                                      //                       fontSize: 12,
                                      //                       fontWeight:
                                      //                           FontWeight
                                      //                               .normal,
                                      //                       color: Theme.of(
                                      //                               context)
                                      //                           .colorScheme
                                      //                           .secondary,
                                      //                     ))),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //           Padding(
                                      //             padding:
                                      //                 const EdgeInsets.all(2.0),
                                      //             child: Text("UI/UX Designer",
                                      //                 style: GoogleFonts.inter(
                                      //                     textStyle:
                                      //                         const TextStyle(
                                      //                   fontSize: 13,
                                      //                   fontWeight:
                                      //                       FontWeight.bold,
                                      //                   color: Colors.black,
                                      //                 ))),
                                      //           ),
                                      //           Row(
                                      //             children: [
                                      //               Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.all(
                                      //                         2.0),
                                      //                 child: Text(
                                      //                     "Chennai.TamilNadu.India",
                                      //                     style:
                                      //                         GoogleFonts.inter(
                                      //                             textStyle:
                                      //                                 TextStyle(
                                      //                       fontSize: 12,
                                      //                       fontWeight:
                                      //                           FontWeight
                                      //                               .normal,
                                      //                       color: Theme.of(
                                      //                               context)
                                      //                           .colorScheme
                                      //                           .secondary,
                                      //                     ))),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     const SizedBox(width: 5),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(15),
                                      //       child: Column(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.center,
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           InkWell(
                                      //             onTap: () {},
                                      //             child: Padding(
                                      //               padding:
                                      //                   const EdgeInsets.all(
                                      //                       2.0),
                                      //               child: Text("Contact info",
                                      //                   style:
                                      //                       GoogleFonts.inter(
                                      //                           textStyle:
                                      //                               const TextStyle(
                                      //                     fontSize: 12,
                                      //                     fontWeight:
                                      //                         FontWeight.normal,
                                      //                     color: Colors.blue,
                                      //                   ))),
                                      //             ),
                                      //           ),
                                      //           Row(
                                      //             children: [
                                      //               Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.only(
                                      //                         right: 4.0),
                                      //                 child: InkWell(
                                      //                   onTap: () {},
                                      //                   child: Image.asset(
                                      //                       height: 35,
                                      //                       width: 35,
                                      //                       "assets/icons/gmail.png"),
                                      //                 ),
                                      //               ),
                                      //               Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.only(
                                      //                         left: 4.0,
                                      //                         right: 4.0),
                                      //                 child: InkWell(
                                      //                   onTap: () {},
                                      //                   child: Image.asset(
                                      //                       height: 25,
                                      //                       width: 25,
                                      //                       "assets/icons/github.png"),
                                      //                 ),
                                      //               ),
                                      //               Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.only(
                                      //                         left: 8,
                                      //                         right: 4),
                                      //                 child: InkWell(
                                      //                   onTap: () {},
                                      //                   child: Image.asset(
                                      //                       height: 25,
                                      //                       width: 25,
                                      //                       "assets/icons/twitter.png"),
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     const Spacer(),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8),
                                      //       child: SizedBox(
                                      //         height: MediaQuery.of(context)
                                      //                 .size
                                      //                 .height *
                                      //             0.055,
                                      //         width: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width *
                                      //             0.075,
                                      //         child:
                                      //             FloatingActionButton.extended(
                                      //           label: Text("Edit Profile",
                                      //               style: GoogleFonts.inter(
                                      //                   color: Colors.white,
                                      //                   fontSize: 12)),
                                      //           backgroundColor: Colors.black,
                                      //           onPressed: () {},
                                      //           shape: RoundedRectangleBorder(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     30.0),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ]),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text("About",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ))),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ReadMoreText(about,
                                          textAlign: TextAlign.start,
                                          trimLines: 5,
                                          trimCollapsedText: ' Show More',
                                          trimExpandedText: ' Show less',
                                          style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("Activity",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ))),
                                            const Spacer(),
                                            TextButton(
                                              onPressed: () {
                                                postDialog(context,
                                                    isAnUpdate: false);
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
                                                                      10))),
                                                  fixedSize:
                                                      WidgetStateProperty.all(
                                                          const Size(100, 30))),
                                              child: Text(
                                                "Create +",
                                                style: GoogleFonts.inter(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      activity.isEmpty
                                          ? SizedBox(
                                              width: double.maxFinite,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.post_add_outlined,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    size: 70,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "No posts created",
                                                    style: GoogleFonts.inter(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : ListView.separated(
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (context, int index) {
                                                return const Divider(
                                                  thickness: 1,
                                                  color: Colors.black,
                                                );
                                              },
                                              itemCount: activity.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("posts")
                                                        .doc(activity[index]
                                                            ["id"])
                                                        .get()
                                                        .then((doc) async {
                                                      Map post = {
                                                        "id": doc.id,
                                                        "collaborator": doc.get(
                                                            "collaborator"),
                                                        "collaborator_req": doc.get(
                                                            "collaborator_req"),
                                                        "duration":
                                                            doc.get("duration"),
                                                        "expertise": doc
                                                            .get("expertise"),
                                                        "hashtags":
                                                            doc.get("hashtags"),
                                                        "meetingDetails": doc.get(
                                                            "meetingDetails"),
                                                        "meetingLink": doc
                                                            .get("meetingLink"),
                                                        "n_comments": doc
                                                            .get("n_comments"),
                                                        "op_email":
                                                            doc.get("op_email"),
                                                        "op_name":
                                                            doc.get("op_name"),
                                                        "op_profile": doc
                                                            .get("op_profile"),
                                                        "post": doc.get("post"),
                                                        "post_images": doc
                                                            .get("post_images"),
                                                        "timestamp": doc
                                                            .get("timestamp"),
                                                        "department": doc
                                                            .get("department"),
                                                        "college":
                                                            doc.get("college"),
                                                        "position":
                                                            doc.get("position"),
                                                        "title":
                                                            doc.get("title"),
                                                        "upvote":
                                                            doc.get("upvote")
                                                      };
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();

                                                      Map inviteDetails = {
                                                        "name": FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .displayName,
                                                        "bio":
                                                            "${prefs.getString("position")} at ${prefs.getString("department")}, ${prefs.getString("college")}",
                                                        "email": FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .email
                                                      };
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      PostPage(
                                                                        post:
                                                                            post,
                                                                        documentID:
                                                                            activity[index]["id"],
                                                                        inviteDetails:
                                                                            inviteDetails,
                                                                      )));
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 8.0),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.05,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.05,
                                                            color: Colors.white,
                                                            child: activity[index]
                                                                        [
                                                                        "photo"]
                                                                    .isEmpty
                                                                ? Image.asset(
                                                                    "assets/icons/gallery_Icon.png")
                                                                : Image.network(
                                                                    activity[
                                                                            index]
                                                                        [
                                                                        "photo"][0],
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(1.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                activity[index]
                                                                    ["title"],
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    GoogleFonts
                                                                        .archivo(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  "${activity[index]["post"]}",
                                                                  style: GoogleFonts
                                                                      .archivo(
                                                                    textStyle:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "${activity[index]["upvote"]} upvotes",
                                                                    style: GoogleFonts
                                                                        .archivo(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "${activity[index]["n_comments"]} comments",
                                                                    style: GoogleFonts
                                                                        .archivo(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.26,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text("Email ID : ",
                                              style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(email,
                                              style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.blue,
                                              ))),
                                        ),
                                      ],
                                    ),
                                  )),
                              const SizedBox(height: 8),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("You might know : ",
                                              style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ))),
                                        ),
                                        const SizedBox(height: 2),
                                        SizedBox(
                                          height: showMore
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.65
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.49,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ListView.builder(
                                              itemCount: userProfiles.length,
                                              itemBuilder: (context, index) {
                                                String text1 = userProfiles.keys
                                                    .elementAt(index);
                                                String text2 = userProfiles
                                                    .values
                                                    .elementAt(index)[0];
                                                String img = userProfiles.values
                                                    .elementAt(index)[1];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4.0,
                                                          bottom: 4,
                                                          right: 8),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: CircleAvatar(
                                                                backgroundColor:
                                                                    const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        11,
                                                                        4,
                                                                        4),
                                                                radius: 20,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        img)),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  text1,
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    textStyle:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  text2,
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    textStyle:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2,
                                                                bottom: 2,
                                                                right: 8.0,
                                                                left: 8),
                                                        child: Divider(
                                                          color: Color.fromARGB(
                                                              255,
                                                              231,
                                                              228,
                                                              228),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              showMore = !showMore;
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                  showMore
                                                      ? 'Show Less'
                                                      : 'Show More',
                                                  style: GoogleFonts.inter(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      143,
                                                                      142,
                                                                      142),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              const SizedBox(height: 8),
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Interests : ",
                                            style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.25,
                                              child: interests.isEmpty
                                                  ? Center(
                                                      child: Text(
                                                        "Display your interests.\nTap on Edit Profile to add.",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.archivo(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    )
                                                  : GridView.builder(
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 2,
                                                        mainAxisSpacing: 2,
                                                        childAspectRatio: 5,
                                                      ),
                                                      itemCount:
                                                          interests.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              interests[index],
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .inter(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .secondary,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                            ))
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
