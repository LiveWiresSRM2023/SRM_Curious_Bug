// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController titleController = TextEditingController();
  TextEditingController abstractController = TextEditingController();
  TextEditingController invitesController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController collaboratorController = TextEditingController();

  Future<void> getAllPosts() async {
    await FirebaseFirestore.instance
        .collection("srmeureka")
        .get()
        .then((QuerySnapshot doc) {
      doc.docs.map((e) => print(e.data()));
    });
  }

  @override
  Widget build(BuildContext context) {
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
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    "https://via.placeholder.com/150"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("Alex Job",
                                              style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 17, 17, 17)))),
                                          InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                  "assets/icons/Polygon 1.png",
                                                  height: 15,
                                                  width: 15,
                                                  color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text("Student",
                                          style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey)))
                                    ]),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: titleController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Title',
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
                        child: TextField(
                          controller: collaboratorController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: '🫂 Collaborators',
                            filled: true,
                            fillColor: Colors.grey[50],
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                  controller: abstractController,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    hintText: 'Whats on your mind?',
                                    filled: false,
                                    fillColor: Colors.grey[50],
                                  ),
                                ),
                              ),
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      //insert media
                                    },
                                    child: Icon(Icons.image,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/icons/image 3.png",
                                      height: 19,
                                      width: 19,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/icons/image 4.png",
                                    height: 19,
                                    width: 19,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text("#",
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      //----------following code for media upload-----Include it in images icon onTap-------------
                      // SizedBox(
                      //   // width: MediaQuery.of(context).size.width *
                      //   //     0.3,
                      //   height: 120,
                      //   child: ListView.builder(
                      //       scrollDirection:
                      //           Axis.horizontal,
                      //       itemCount:
                      //           images.length + 1,
                      //       itemBuilder:
                      //           (BuildContext
                      //                   context,
                      //               int index) {
                      //         if (index ==
                      //             images.length) {
                      //           return Padding(
                      //             padding:
                      //                 const EdgeInsets
                      //                     .all(
                      //                     10.0),
                      //             child: SizedBox(
                      //               height: 100,
                      //               width: 100,
                      //               child: InkWell(
                      //                 onTap:
                      //                     () async {
                      //                   FilePickerResult?
                      //                       picker =
                      //                       await FilePicker.platform.pickFiles(
                      //                           allowMultiple:
                      //                               true,
                      //                           type:
                      //                               FileType.image);
                      //                   if (picker !=
                      //                       null) {
                      //                     for (PlatformFile image
                      //                         in picker
                      //                             .files) {
                      //                       images.add(
                      //                           image.bytes);
                      //                       Reference
                      //                           storageRef =
                      //                           FirebaseStorage.instance.ref("/srmeureka/posts/${const Uuid().v4()}.png");
                      //                       await storageRef
                      //                           .putData(image.bytes!);
                      //                       mediaUrl
                      //                           .add(await storageRef.getDownloadURL());
                      //                     }
                      //                     mediaUploaded =
                      //                         true;
                      //                     dialogState(
                      //                         () {});
                      //                     print(
                      //                         images);
                      //                   }
                      //                 },
                      //                 child:
                      //                     Container(
                      //                   height: 100,
                      //                   width: 100,
                      //                   decoration: BoxDecoration(
                      //                       color: Colors
                      //                           .grey
                      //                           .shade200,
                      //                       borderRadius:
                      //                           BorderRadius.circular(
                      //                               20),
                      //                       border: Border.all(
                      //                           color:
                      //                               Colors.grey,
                      //                           width: 1)),
                      //                   child: Icon(
                      //                     Icons.add,
                      //                     color: Theme.of(
                      //                             context)
                      //                         .colorScheme
                      //                         .primary,
                      //                     size: 20,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           );
                      //         } else {
                      //           return Padding(
                      //             padding:
                      //                 const EdgeInsets
                      //                     .all(
                      //                     10.0),
                      //             child: Container(
                      //               width: 100,
                      //               height: 100,
                      //               decoration: BoxDecoration(
                      //                   border: Border.all(
                      //                       color: Colors
                      //                           .grey,
                      //                       width:
                      //                           1),
                      //                   borderRadius:
                      //                       BorderRadius.circular(
                      //                           20),
                      //                   image: DecorationImage(
                      //                       fit: BoxFit
                      //                           .fill,
                      //                       image: MemoryImage(
                      //                           images[index]))),
                      //             ),
                      //           );
                      //         }
                      //       }),
                      // ),
                      // // SizedBox(
                      // //     height: 120,
                      // //     child: SizedBox(
                      // //       width: (MediaQuery.of(context)
                      // //                   .size
                      // //                   .width *
                      // //               0.4) -
                      // //           100,
                      // //       child: Row(
                      // //         mainAxisAlignment:
                      // //             MainAxisAlignment.spaceBetween,
                      // //         crossAxisAlignment:
                      // //             CrossAxisAlignment.center,
                      // //         children: [
                      // //           images.isEmpty
                      // //               ? const SizedBox(width: 0)
                      // //               : Row(
                      // //                   mainAxisAlignment:
                      // //                       MainAxisAlignment
                      // //                           .start,
                      // //                   crossAxisAlignment:
                      // //                       CrossAxisAlignment
                      // //                           .center,
                      // //                   children: List.generate(
                      // //                       images.length,
                      // //                       (index) => )),

                      // //         ],
                      // //       ),
                      // //     )),
                      // const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/icons/image 7.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // List images = [];
                                      // bool mediaUploaded = false;
                                      // List<String> mediaUrl = [];
                                      return AlertDialog(
                                          backgroundColor: Colors.white,
                                          elevation: 0.0,
                                          content: StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter dialogState) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  // height: 500,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Image.asset(
                                                              "assets/images/man-uploading-data.png",
                                                              height: 200,
                                                              width: 200),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "Your post was successful",
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 25.0,
                                                                letterSpacing:
                                                                    0.8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Text(
                                                            "Continue",
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle:
                                                                  const TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                decorationColor:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "Your contribution could make a difference. Thanks for sharing !",
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondary,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 226, 223, 223),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 4, right: 4, top: 1, bottom: 1),
                                child: Text(
                                  "Post",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 10.0,
                                      letterSpacing: 0.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
