// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/mini_profile.dart';
import 'package:srm_curious_bug/pages/feed/posts.dart';
import 'package:srm_curious_bug/widgets/custom_textfield.dart';
import 'package:uuid/uuid.dart';

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

  Future<void> getAllPosts() async {
    await FirebaseFirestore.instance
        .collection("srmeureka")
        .get()
        .then((QuerySnapshot doc) {
      doc.docs.map((e) => print(e.data()));
    });
  }

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
    bool collaborationSwitch = false;
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
                                List images = [];
                                bool mediaUploaded = false;
                                List<String> mediaUrl = [];
                                return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 0.0,
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter dialogState) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SingleChildScrollView(
                                          child: Container(
                                            // height: 500,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              // border: Border.all(
                                              //   color: Theme.of(context).colorScheme.primary,
                                              //   width: 2.0,
                                              // ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Title",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextField(
                                                      controller:
                                                          titleController,
                                                      maxLines: 1,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter your text here',
                                                        filled: true,
                                                        fillColor:
                                                            Colors.grey[50],
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          width: 1,
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Abstract",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextField(
                                                      controller:
                                                          abstractController,
                                                      maxLines: 2,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter your text here',
                                                        filled: true,
                                                        fillColor:
                                                            Colors.grey[50],
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                            width: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Media",
                                                      style: GoogleFonts.inter(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  SizedBox(
                                                    // width: MediaQuery.of(context).size.width *
                                                    //     0.3,
                                                    height: 120,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            images.length + 1,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          if (index ==
                                                              images.length) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    FilePickerResult?
                                                                        picker =
                                                                        await FilePicker.platform.pickFiles(
                                                                            allowMultiple:
                                                                                true,
                                                                            type:
                                                                                FileType.image);
                                                                    if (picker !=
                                                                        null) {
                                                                      for (PlatformFile image
                                                                          in picker
                                                                              .files) {
                                                                        images.add(
                                                                            image.bytes);
                                                                        Reference
                                                                            storageRef =
                                                                            FirebaseStorage.instance.ref("/srmeureka/posts/${const Uuid().v4()}.png");
                                                                        await storageRef
                                                                            .putData(image.bytes!);
                                                                        mediaUrl
                                                                            .add(await storageRef.getDownloadURL());
                                                                      }
                                                                      mediaUploaded =
                                                                          true;
                                                                      dialogState(
                                                                          () {});
                                                                      print(
                                                                          images);
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade200,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey,
                                                                            width: 1)),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .primary,
                                                                      size: 20,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    image: DecorationImage(
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        image: MemoryImage(
                                                                            images[index]))),
                                                              ),
                                                            );
                                                          }
                                                        }),
                                                  ),
                                                  // SizedBox(
                                                  //     height: 120,
                                                  //     child: SizedBox(
                                                  //       width: (MediaQuery.of(context)
                                                  //                   .size
                                                  //                   .width *
                                                  //               0.4) -
                                                  //           100,
                                                  //       child: Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment.spaceBetween,
                                                  //         crossAxisAlignment:
                                                  //             CrossAxisAlignment.center,
                                                  //         children: [
                                                  //           images.isEmpty
                                                  //               ? const SizedBox(width: 0)
                                                  //               : Row(
                                                  //                   mainAxisAlignment:
                                                  //                       MainAxisAlignment
                                                  //                           .start,
                                                  //                   crossAxisAlignment:
                                                  //                       CrossAxisAlignment
                                                  //                           .center,
                                                  //                   children: List.generate(
                                                  //                       images.length,
                                                  //                       (index) => )),

                                                  //         ],
                                                  //       ),
                                                  //     )),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.25) -
                                                            10,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "Invite",
                                                                style:
                                                                    GoogleFonts
                                                                        .archivo(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 5),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.04,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.15,
                                                                child:
                                                                    TextField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                8),
                                                                    hintText:
                                                                        'Enter your text here',
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors.grey[
                                                                            50],
                                                                    hintStyle:
                                                                        GoogleFonts
                                                                            .archivo(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    // filled: true,
                                                                    // fillColor: Colors.grey[50],
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .primary,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.25) -
                                                            10,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Collaborate",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            Transform.scale(
                                                              scale: 0.5,
                                                              child:
                                                                  ColorFiltered(
                                                                colorFilter:
                                                                    ColorFilter
                                                                        .mode(
                                                                  Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                  BlendMode
                                                                      .srcIn,
                                                                ),
                                                                child:
                                                                    CupertinoSwitch(
                                                                  value:
                                                                      collaborationSwitch,
                                                                  onChanged: (bool
                                                                      value) {
                                                                    setState(
                                                                        () {
                                                                      collaborationSwitch =
                                                                          value;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.25) -
                                                            10,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Topics",
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 4),
                                                              const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Expanded(
                                                                  child: Wrap(
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    children: [
                                                                      HashTagWidget1(
                                                                          'twitter'),
                                                                      HashTagWidget1(
                                                                          'srm'),
                                                                      HashTagWidget1(
                                                                          'ig'),
                                                                      HashTagWidget1(
                                                                          'srmist'),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.25) -
                                                            10,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Duration",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 60,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      durationController,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                8),
                                                                    hintText:
                                                                        'Enter duration',
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors.grey[
                                                                            50],
                                                                    hintStyle:
                                                                        GoogleFonts
                                                                            .archivo(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    // filled: true,
                                                                    // fillColor: Colors.grey[50],
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .primary,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          Map<String, dynamic>
                                                              storeData = {
                                                            "title":
                                                                titleController
                                                                    .text,
                                                            "upvote": "0",
                                                            "post":
                                                                abstractController
                                                                    .text,
                                                            "timestamp":
                                                                DateTime.now()
                                                                    .toString(),
                                                            "op_name":
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .displayName,
                                                            "n_comments": 0,
                                                            "hashtags": [
                                                              "legaltech",
                                                              "python",
                                                              "nlp"
                                                            ],
                                                            "op_email":
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .email,
                                                            "op_profile":
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .photoURL,
                                                            "comments":
                                                                "/collection/{docID}",
                                                            "post_images": [
                                                              "https://picsum.photos/600/300",
                                                              "https://picsum.photos/600/300"
                                                            ],
                                                            "duration":
                                                                durationController
                                                                    .text,
                                                            "expertise": [
                                                              "Python",
                                                              "Natural Language Processing (NLP)"
                                                            ]
                                                          };
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "srmeureka")
                                                              .doc(const Uuid()
                                                                  .v4())
                                                              .set(storeData);
                                                          await getAllPosts();
                                                          setState(() {
                                                            posts.insert(
                                                                0, storeData);
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        splashColor: Colors
                                                            .white
                                                            .withOpacity(0.5),
                                                        highlightColor:
                                                            Colors.transparent,
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'SUBMIT',
                                                                style:
                                                                    GoogleFonts
                                                                        .archivo(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }));
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
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.047,
                            height: MediaQuery.of(context).size.height * 0.047,
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
                      child: MiniProfile(),
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
