import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/mini_profile.dart';
import 'package:srm_curious_bug/pages/feed/posts.dart';
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
      "op_profile": "assets/images/srm_logo.png",
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
      "op_profile": "assets/images/srm_logo.png",
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
      "op_profile": "assets/images/srm_logo.png",
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
    bool _switch = false;
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 1,
            child: MiniProfile(),
          ),
          const VerticalDivider(
            color: Color(0xffdcdcdc),
            width: 1,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            borderColor: Theme.of(context).colorScheme.primary,
                            width: double.maxFinite,
                            labelText: "Search",
                            leadingIcon: const Icon(Icons.search),
                            showLabel: false),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Chip(
                                  label: Text(
                                    "Posts",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Chip(
                                    label: Text(
                                  "Topics",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Chip(
                                    label: Text(
                                  "Media",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Chip(
                                    label: Text(
                                  "User",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Chip(
                                    label: Text(
                                  "Events",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                          ),
                        )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Image.asset("assets/images/srm_logo.png",
                        //         width: 50, height: 50),
                        //     const SizedBox(
                        //       width: 20,
                        //     ),
                        //     Text(
                        //       "Whats's on your mind?",
                        //       style: GoogleFonts.archivo(
                        //           fontSize: 20, color: const Color(0xff5B7083)),
                        //     )
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(2.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       InkWell(
                        //         onTap: () {},
                        //         child: Image.asset(
                        //             "assets/icons/gallery_icon.png"),
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       InkWell(
                        //         onTap: () {},
                        //         child:
                        //             Image.asset("assets/icons/data_icon.png"),
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       InkWell(
                        //         onTap: () {},
                        //         child:
                        //             Image.asset("assets/icons/emojii_icon.png"),
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       InkWell(
                        //         onTap: () {},
                        //         child: Image.asset(
                        //             "assets/icons/calendar_icon.png"),
                        //       ),
                        //       const Spacer(),
                        //       TextButton(
                        //         onPressed: () {},
                        //         style: ButtonStyle(
                        //             fixedSize: MaterialStateProperty.all(
                        //                 const Size(100, 30)),
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 Theme.of(context).colorScheme.primary)),
                        //         child: Text(
                        //           "Post",
                        //           style: GoogleFonts.archivo(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 15),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 210,
                      child: Post(
                        posts: posts,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(
            color: Color(0xffdcdcdc),
            width: 1,
          ),
          const Expanded(
            flex: 1,
            child: Events(),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.09,
        child: FloatingActionButton.extended(
          label:
              Text("New Post", style: GoogleFonts.inter(color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  List images = [];
                  return AlertDialog(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      content: StatefulBuilder(builder:
                          (BuildContext context, StateSetter dialogState) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Container(
                              // height: 500,
                              width: MediaQuery.of(context).size.width * 0.4,
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
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                          hintText: 'Enter your text here',
                                          filled: true,
                                          fillColor: Colors.grey[50],
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
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
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          hintText: 'Enter your text here',
                                          filled: true,
                                          fillColor: Colors.grey[50],
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
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            if (index == images.length) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      FilePickerResult? picker =
                                                          await FilePicker
                                                              .platform
                                                              .pickFiles(
                                                                  allowMultiple:
                                                                      true,
                                                                  type: FileType
                                                                      .image);
                                                      if (picker != null) {
                                                        for (PlatformFile image
                                                            in picker.files) {
                                                          images
                                                              .add(image.bytes);
                                                        }
                                                        dialogState(() {});
                                                        print(images);
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
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
                                    Padding(
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
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.09,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  hintText:
                                                      'Enter your text here',
                                                  filled: true,
                                                  fillColor: Colors.grey[50],
                                                  hintStyle:
                                                      GoogleFonts.archivo(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                BlendMode.srcIn,
                                              ),
                                              child: CupertinoSwitch(
                                                value: _switch,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    _switch = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Topics",
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Expanded(
                                              child: Wrap(
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  HashTagWidget1('#twitter'),
                                                  HashTagWidget1('#srm'),
                                                  HashTagWidget1('#ig'),
                                                  HashTagWidget1('#srmist'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushReplacementNamed(
                                                context, '/feed');
                                          },
                                          splashColor:
                                              Colors.white.withOpacity(0.5),
                                          highlightColor: Colors.transparent,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
          },
          //mini: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          icon: const Icon(Icons.add),
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
