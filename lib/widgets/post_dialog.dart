import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:srm_curious_bug/pages/feed/feed.dart';
import 'package:uuid/uuid.dart';

postDialog(BuildContext context) {
  TextEditingController titleController = TextEditingController();
  TextEditingController abstractController = TextEditingController();
  TextEditingController invitesController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController collaboratorController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        List images = [];
        bool mediaUploaded = false;
        List<String> mediaUrl = [];
        bool collaborationSwitch = false;
        return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 0.0,
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter dialogState) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Container(
                    // height: 500,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      // border: Border.all(
                      //   color: Theme.of(context).colorScheme.primary,
                      //   width: 2.0,
                      // ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Title",
                              style: GoogleFonts.archivo(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: titleController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Enter your text here',
                                filled: true,
                                fillColor: Colors.grey[50],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Abstract",
                              style: GoogleFonts.archivo(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: abstractController,
                              maxLines: 2,
                              decoration: InputDecoration(
                                hintText: 'Enter your text here',
                                filled: true,
                                fillColor: Colors.grey[50],
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Media",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length + 1,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index == images.length) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: InkWell(
                                          onTap: () async {
                                            FilePickerResult? picker =
                                                await FilePicker.platform
                                                    .pickFiles(
                                                        allowMultiple: true,
                                                        type: FileType.image);
                                            if (picker != null) {
                                              for (PlatformFile image
                                                  in picker.files) {
                                                images.add(image.bytes);
                                                Reference storageRef =
                                                    FirebaseStorage.instance.ref(
                                                        "/srmeureka/posts/${const Uuid().v4()}.png");
                                                await storageRef
                                                    .putData(image.bytes!);
                                                mediaUrl.add(await storageRef
                                                    .getDownloadURL());
                                              }
                                              mediaUploaded = true;
                                              dialogState(() {});
                                              print(images);
                                            }
                                          },
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            child: Icon(
                                              Icons.add,
                                              color: Theme.of(context)
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
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
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
                                width:
                                    (MediaQuery.of(context).size.width * 0.25) -
                                        10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Invite",
                                        style: GoogleFonts.archivo(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(left: 8),
                                            hintText: 'Enter your text here',
                                            filled: true,
                                            fillColor: Colors.grey[50],
                                            hintStyle: GoogleFonts.archivo(
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                            // filled: true,
                                            // fillColor: Colors.grey[50],
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                width: 1,
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
                                width:
                                    (MediaQuery.of(context).size.width * 0.25) -
                                        10,
                                child: Row(
                                  children: [
                                    Text(
                                      "Collaborate",
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Transform.scale(
                                      scale: 0.5,
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          Theme.of(context).colorScheme.primary,
                                          BlendMode.srcIn,
                                        ),
                                        child: CupertinoSwitch(
                                          value: collaborationSwitch,
                                          onChanged: (bool value) {
                                            dialogState(() {
                                              collaborationSwitch = value;
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
                              // SizedBox(
                              //   width:
                              //       (MediaQuery.of(context).size.width * 0.25) -
                              //           10,
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         Text(
                              //           "Topics",
                              //           style: GoogleFonts.inter(
                              //             fontSize: 16,
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.black,
                              //           ),
                              //         ),
                              //         const SizedBox(width: 4),
                              //         const Padding(
                              //           padding: EdgeInsets.all(8.0),
                              //           child: Expanded(
                              //             child: Wrap(
                              //               alignment: WrapAlignment.center,
                              //               children: [
                              //                 HashTagWidget1('twitter'),
                              //                 HashTagWidget1('srm'),
                              //                 HashTagWidget1('ig'),
                              //                 HashTagWidget1('srmist'),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width * 0.25) -
                                        10,
                                child: Row(
                                  children: [
                                    Text(
                                      "Duration",
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: durationController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(left: 8),
                                            hintText: 'Enter duration',
                                            filled: true,
                                            fillColor: Colors.grey[50],
                                            hintStyle: GoogleFonts.archivo(
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                            // filled: true,
                                            // fillColor: Colors.grey[50],
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                width: 1,
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
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () async {
                                  Map<String, dynamic> storeData = {
                                    "title": titleController.text,
                                    "upvote": "0",
                                    "post": abstractController.text,
                                    "timestamp": DateTime.now().toString(),
                                    "op_name": FirebaseAuth
                                        .instance.currentUser!.displayName,
                                    "n_comments": 0,
                                    "hashtags": ["legaltech", "python", "nlp"],
                                    "op_email": FirebaseAuth
                                        .instance.currentUser!.email,
                                    "op_profile": FirebaseAuth
                                        .instance.currentUser!.photoURL,
                                    "comments": "/collection/{docID}",
                                    "post_images": [
                                      "https://picsum.photos/600/300",
                                      "https://picsum.photos/600/300"
                                    ],
                                    "duration": durationController.text,
                                    "expertise": [
                                      "Python",
                                      "Natural Language Processing (NLP)"
                                    ]
                                  };
                                  FirebaseFirestore.instance
                                      .collection("srmeureka")
                                      .doc(const Uuid().v4())
                                      .set(storeData);
                                  // await getAllPosts();
                                  dialogState(() {
                                    // posts.insert(0,storeData);
                                    Navigator.pop(context);
                                  });
                                },
                                splashColor: Colors.white.withOpacity(0.5),
                                highlightColor: Colors.transparent,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SUBMIT',
                                        style: GoogleFonts.archivo(
                                          color: Colors.white,
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
}