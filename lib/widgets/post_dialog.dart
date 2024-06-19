// ignore_for_file: avoid_print

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:srm_curious_bug/pages/feed/feed.dart';
import 'package:uuid/uuid.dart';

postDialog(BuildContext context) {
  TextEditingController titleController = TextEditingController();
  TextEditingController abstractController = TextEditingController();
  TextEditingController invitesController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController literatureStudyController = TextEditingController();
  // ignore: unused_local_variable
  TextEditingController collaboratorController = TextEditingController();
  List invities = [];
  return showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        List images = [];
        // ignore: unused_local_variable
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
                              "Create a new Post ",
                              style: GoogleFonts.archivo(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
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
                                suffixIcon: Icon(
                                  Icons.title,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
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
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Enter abstract here',
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Literature study",
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
                              controller: literatureStudyController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                suffixIcon: Transform.rotate(
                                  angle: 90,
                                  child: Icon(
                                    Icons.link,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                hintText: 'Enter link here',
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
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Invite",
                                  style: GoogleFonts.archivo(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 280,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            width: 180,
                                            child: TextField(
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.inter(
                                                  fontSize: 14),
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              controller: invitesController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.all(8),
                                                hintText: 'Add collaborator',

                                                filled: true,
                                                fillColor: Colors.grey[50],

                                                // suffix: IconButton(
                                                //   icon: const Icon(Icons.add),
                                                //   onPressed: () {
                                                //     dialogState(() {
                                                //       invities.add(
                                                //           invitesController.text);
                                                //     });
                                                //   },
                                                // ),
                                                hintStyle: GoogleFonts.archivo(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
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
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                dialogState(() {
                                                  invities.add(
                                                      invitesController.text);
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                    0.25) -
                                                10,
                                        height: 40,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: invities.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Text(
                                                        invities[index],
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize: 10,
                                                      color: Colors.black,
                                                      icon: const Icon(
                                                          Icons.close),
                                                      onPressed: () {
                                                        dialogState(() {
                                                          invities.remove(
                                                              invitesController
                                                                  .text);
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Collaborate",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 300),
                                AnimatedToggleSwitch<bool>.dual(
                                  current: collaborationSwitch,
                                  first: true,
                                  second: false,
                                  spacing: 50.0,
                                  style: const ToggleStyle(
                                    borderColor: Colors.transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 1.5),
                                      ),
                                    ],
                                  ),
                                  borderWidth: 1.0,
                                  height: 33,
                                  onChanged: (b) => dialogState(
                                      () => collaborationSwitch = b),
                                  styleBuilder: (b) => ToggleStyle(
                                      indicatorColor: b
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary),
                                  iconBuilder: (value) => value
                                      ? const Icon(Icons.close)
                                      : const Icon(Icons.check),
                                  textBuilder: (value) => value
                                      ? const Center(child: Text('Decline'))
                                      : const Center(child: Text('Invite')),
                                ),
                              ],
                            ),
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
                                child: TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all(Colors.black),
                                      shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      fixedSize: WidgetStateProperty.all(
                                          const Size(100, 30))),
                                  child: Text(
                                    "Submit",
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
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
