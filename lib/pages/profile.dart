import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:srm_curious_bug/pages/feed/create.dart';
import 'package:srm_curious_bug/pages/feed/feed.dart';
import 'package:srm_curious_bug/widgets/appbar.dart';
import 'package:srm_curious_bug/widgets/custom_textfield.dart';
import 'package:srm_curious_bug/widgets/post_dialog.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    Map<String, String> textMap = {
      "UI/UX Designer": "InterMediate",
      "Figma": "Beginner",
      "ProductDesigner": "Beginner",
    };

    Map<String, List> userProfiles = {
      "Alex Job A": ["UI/UX Designer", "assets/images/pfp.jpg"],
      "Roshan SK": ["Software Developer", "assets/images/pfp.jpg"],
      "Sudharshan": ["UI/UX Developer", "assets/images/pfp.jpg"],
      "Abin": ["Data Scientist", "assets/images/pfp.jpg"],
    };

    Map<String, List> UserActivities = {
      "Alex Job A": [
        "3w",
        "assets/images/bluebells.jpg",
        "Had an amazing experience organizing Techutsav, An intra college event! Rocked the role of creative head, designing invitations, event details, banners, and backdrops. The Tech Innovation Challenge provided the perfect platform for us to unleash our creativity, problem-solving skills, and technical prowess. With fervor in our hearts and lines of code at our fingertips, we set out to tackle one of the most pressing issues of our time: transportation in urban landscapes.Big learning experience - leveled up my pressure management skills for sure! Plus, I met some super talented people along the way! 🔥✨"
      ],
      "Roshan SK": [
        "5w",
        "assets/images/bluebells.jpg",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      ],
    };

    Map profileInto = {
      "position": "Student at SRM FSH",
      "degree": "Master in Applied Data Science",
      "department": "Faculty of Science and Humanities",
      "website": "www.google.com"
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
      appBar: appBar(context),
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
                                padding: const EdgeInsets.only(
                                    left: 10.0, bottom: 10, right: 10),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: 200,
                                                  width: 200,
                                                  decoration:
                                                      BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          // image: DecorationImage(image: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!))
                                                          image: DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!))),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Roshan SK",
                                                  style: GoogleFonts.inter(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Tamil Nadu | Chennai",
                                                  style: GoogleFonts.inter(
                                                      color: Colors.black,
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
                                                              onTap: () {
                                                                
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                contactImages.keys.toList()[
                                                                    index],
                                                                height: 30,
                                                                width: 30,
                                                              ),
                                                            ),
                                                          )),
                                                )
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
                                      child: ReadMoreText(
                                          "Making magic on screens (UI/UX design) by day. When I'm off the clock, it's church, guitar jams, and good vibes. Love meeting new people. Always up to connect! Making magic on screens (UI/UX design) by day. When I'm off the clock, it's church, guitar jams, and good vibes. Love meeting new people. Always up to connect!Making magic on screens (UI/UX design) by day. When I'm off the clock, it's church, guitar jams, and good vibes. Love meeting new people. Always up to connect!.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                          textAlign: TextAlign.start,
                                          trimLines: 5,
                                          trimCollapsedText: ' Show More',
                                          style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                            fontSize: 11,
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
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.055,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.075,
                                                child: FloatingActionButton
                                                    .extended(
                                                  label: Text("Create +",
                                                      style: GoogleFonts.inter(
                                                          color: Colors.white,
                                                          fontSize: 12)),
                                                  backgroundColor: Colors.black,
                                                  onPressed: () {
                                                    postDialog(context);
                                                    // showDialog(
                                                    //     context: context,
                                                    //     builder:
                                                    //         (BuildContext
                                                    //             context) {
                                                    //       return postDialog(context);
                                                    //     });
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.44,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListView.builder(
                                            itemCount: UserActivities.length,
                                            itemBuilder: (context, index) {
                                              String username = UserActivities
                                                  .keys
                                                  .elementAt(index);
                                              String durationofpost =
                                                  UserActivities.values
                                                      .elementAt(index)[0];
                                              String postimg = UserActivities
                                                  .values
                                                  .elementAt(index)[1];
                                              String abt = UserActivities.values
                                                  .elementAt(index)[2];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Text(username,
                                                              style: GoogleFonts
                                                                  .inter(
                                                                      textStyle:
                                                                          TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondary,
                                                              ))),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Text(
                                                              "posted this",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                      textStyle:
                                                                          TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondary,
                                                              ))),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Text(
                                                              " . $durationofpost",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                      textStyle:
                                                                          TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondary,
                                                              ))),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 8.0,
                                                                  right: 4,
                                                                  bottom: 8),
                                                          child: Container(
                                                              height: MediaQuery
                                                                          .of(
                                                                              context)
                                                                      .size
                                                                      .height *
                                                                  0.09,
                                                              width:
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.09,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                              child:
                                                                  Image.asset(
                                                                postimg,
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.53,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: ReadMoreText(
                                                                abt,
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                trimLines: 3,
                                                                trimMode:
                                                                    TrimMode
                                                                        .Line,
                                                                trimCollapsedText:
                                                                    ' Show More',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                        textStyle:
                                                                            const TextStyle(
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .black,
                                                                ))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    const Divider(
                                                        height: 1,
                                                        color: Color.fromARGB(
                                                            255,
                                                            187,
                                                            185,
                                                            185)),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
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
                                          child: Text("User ID : ",
                                              style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                              "www.srmcuriousbees.in/alex_job",
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
                                            "Skills : ",
                                            style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ListView.builder(
                                              itemCount: textMap.length,
                                              itemBuilder: (context, index) {
                                                String text1 = textMap.keys
                                                    .elementAt(index);
                                                String text2 = textMap.values
                                                    .elementAt(index);
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    14,
                                                                    14,
                                                                    14))),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              text1,
                                                              style: GoogleFonts
                                                                  .inter(
                                                                textStyle:
                                                                    const TextStyle(
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          text2,
                                                          style:
                                                              GoogleFonts.inter(
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
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
