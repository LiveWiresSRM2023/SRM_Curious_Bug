import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srm_curious_bug/pages/feed/announcements.dart';
import 'package:srm_curious_bug/pages/feed/events.dart';
import 'package:srm_curious_bug/pages/feed/posts.dart';
import 'package:srm_curious_bug/pages/post_page.dart';
import 'package:srm_curious_bug/pages/profile.dart';
import 'package:srm_curious_bug/utils/constants.dart';
import 'package:srm_curious_bug/widgets/hashtag.dart';
import 'package:srm_curious_bug/widgets/post_dialog.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with TickerProviderStateMixin {
  TextEditingController titleController = TextEditingController();
  TextEditingController abstractController = TextEditingController();
  TextEditingController invitesController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  bool loadingPosts = true;
  bool searching = false;
  List posts = [];

  // checkAuthState() {
  //   if (FirebaseAuth.instance.currentUser == null) {

  //   }
  // }

  getAllPosts() async {
    setState(() {
      loadingPosts = true;
    });
    posts = [];
    await FirebaseFirestore.instance
        .collection("posts")
        .get()
        .then((QuerySnapshot docs) {
      for (var doc in docs.docs) {
        posts.add({
          "id": doc.id,
          "collaborator": doc.get("collaborator"),
          "collaborator_req": doc.get("collaborator_req"),
          "duration": doc.get("duration"),
          "expertise": doc.get("expertise"),
          "hashtags": doc.get("hashtags"),
          "meetingDetails": doc.get("meetingDetails"),
          "meetingLink": doc.get("meetingLink"),
          "n_comments": doc.get("n_comments"),
          "op_email": doc.get("op_email"),
          "op_name": doc.get("op_name"),
          "op_profile": doc.get("op_profile"),
          "post": doc.get("post"),
          "post_images": doc.get("post_images"),
          "timestamp": doc.get("timestamp"),
          "literatureStudy": doc.get("literatureStudy"),
          "department": doc.get("department"),
          "college": doc.get("college"),
          "position": doc.get("position"),
          "title": doc.get("title"),
          "upvote": doc.get("upvote")
        });
      }
    });

    setState(() {
      searching = false;
      loadingPosts = false;
    });
  }

  queryCollegeInPosts(String college) async {
    setState(() {
      loadingPosts = true;
    });
    posts = [];
    await FirebaseFirestore.instance
        .collection("posts")
        .where("college", isEqualTo: college)
        .get()
        .then((QuerySnapshot docs) {
      for (var doc in docs.docs) {
        posts.add({
          "id": doc.id,
          "collaborator": doc.get("collaborator"),
          "collaborator_req": doc.get("collaborator_req"),
          "duration": doc.get("duration"),
          "expertise": doc.get("expertise"),
          "hashtags": doc.get("hashtags"),
          "meetingDetails": doc.get("meetingDetails"),
          "meetingLink": doc.get("meetingLink"),
          "n_comments": doc.get("n_comments"),
          "op_email": doc.get("op_email"),
          "op_name": doc.get("op_name"),
          "op_profile": doc.get("op_profile"),
          "post": doc.get("post"),
          "post_images": doc.get("post_images"),
          "timestamp": doc.get("timestamp"),
          "literatureStudy": doc.get("literatureStudy"),
          "department": doc.get("department"),
          "college": doc.get("college"),
          "position": doc.get("position"),
          "title": doc.get("title"),
          "upvote": doc.get("upvote")
        });
      }
    });

    setState(() {
      loadingPosts = false;
    });
  }

  int selectedIndex = 0;
  Map<String, AssetImage> el = {
    'All': const AssetImage("assets/icons/degree.png"),
    'Science': const AssetImage("assets/icons/science.png"),
    'Humanities': const AssetImage("assets/icons/business.png"),
    'Business': const AssetImage("assets/icons/business.png"),
    'Law': const AssetImage("assets/icons/law.png"),
  };
  List followedTopics = [];
  List recentPosts = [];

  void loadFollowedTopics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("topics")) {
      setState(() {
        followedTopics = prefs.getStringList("topics")!;
      });
    }
  }

  void loadRecentPosts() async {
    recentPosts = [];
    print("Called recent posts");
    await FirebaseFirestore.instance
        .collection("posts")
        .where("op_email",
            isEqualTo: FirebaseAuth.instance.currentUser!.email.toString())
        .limit(5)
        .get()
        .then((docs) {
      for (var doc in docs.docs) {
        recentPosts.add({
          "id": doc.id,
          "title": doc.get("title"),
          "photo": doc.get("post_images"),
          "upvote": doc.get("upvote"),
          "n_comments": doc.get("n_comments")
        });
      }
    });
    setState(() {});
  }

  searchInPosts(List documentIds) async {
    setState(() {
      searching = true;
      loadingPosts = true;
    });
    posts = [];
    await FirebaseFirestore.instance
        .collection("posts")
        .where(FieldPath.documentId, whereIn: documentIds)
        .get()
        .then((QuerySnapshot docs) {
      for (var doc in docs.docs) {
        posts.add({
          "id": doc.id,
          "collaborator": doc.get("collaborator"),
          "collaborator_req": doc.get("collaborator_req"),
          "duration": doc.get("duration"),
          "expertise": doc.get("expertise"),
          "hashtags": doc.get("hashtags"),
          "meetingDetails": doc.get("meetingDetails"),
          "meetingLink": doc.get("meetingLink"),
          "n_comments": doc.get("n_comments"),
          "op_email": doc.get("op_email"),
          "op_name": doc.get("op_name"),
          "op_profile": doc.get("op_profile"),
          "post": doc.get("post"),
          "post_images": doc.get("post_images"),
          "timestamp": doc.get("timestamp"),
          "literatureStudy": doc.get("literatureStudy"),
          "department": doc.get("department"),
          "college": doc.get("college"),
          "position": doc.get("position"),
          "title": doc.get("title"),
          "upvote": doc.get("upvote")
        });
      }
    });
    setState(() {
      loadingPosts = false;
    });
  }

  @override
  void initState() {
    getAllPosts();
    loadFollowedTopics();
    loadRecentPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //bool collaborationSwitch = false;
    TabController maintabcontroller = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/feed');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"))),
            ),
          ),
        ),
        centerTitle: true,
        title: SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.45,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              labelText: "Search",
              suffixIcon: SizedBox(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         // Icon(Icons.sort,
                    //         //     color: Theme.of(context).colorScheme.primary),
                    //         DropdownButtonHideUnderline(
                    //           child: DropdownButton<String>(
                    //             icon: Padding(
                    //               padding: const EdgeInsets.only(left: 1),
                    //               child: Icon(Icons.sort,
                    //                   color:
                    //                       Theme.of(context).colorScheme.secondary),
                    //             ),
                    //             iconSize: 20,
                    //             elevation: 10,
                    //             style: GoogleFonts.inter(
                    //                 textStyle:
                    //                     const TextStyle(color: Colors.black)),
                    //             dropdownColor: Colors.grey[200],
                    //             hint: Text('filter',
                    //                 style: GoogleFonts.inter(
                    //                   textStyle: TextStyle(
                    //                       fontWeight: FontWeight.w500,
                    //                       color: Theme.of(context)
                    //                           .colorScheme
                    //                           .secondary),
                    //                 )),
                    //             value: null, // Initially selected value or null
                    //             onChanged: (String? newValue) {
                    //               // Handle dropdown value change
                    //             },
                    //             items: filterNames.map((String value) {
                    //               return DropdownMenuItem<String>(
                    //                 value: value,
                    //                 child: Text(
                    //                   value,
                    //                   style: GoogleFonts.inter(
                    //                       textStyle: const TextStyle(fontSize: 16)),
                    //                 ),
                    //               );
                    //             }).toList(),
                    //           ),
                    //         ),
                    //       ]),
                    // ),
                    IconButton(
                        onPressed: () async {
                          if (searching) {
                            await getAllPosts();
                          } else {
                            http.Response res = await http
                                .post(Uri.parse("$url/post"),
                                    headers: {
                                      "Access-Control-Allow-Origin": "*",
                                      'Content-Type': 'application/json',
                                      'Accept': '*/*'
                                    },
                                    body: jsonEncode({
                                      "user_id": "123",
                                      "type": "search",
                                      "content":
                                          searchController.text.toString(),
                                      "id": "123"
                                    }))
                                .onError((e, s) {
                              print(e);
                              throw "Error on querying request to QDrant";
                            });
                            print(res.body);
                            if (jsonDecode(res.body)["msg"] ==
                                "There was an error") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          "There was an error, Please try again later")));
                            } else {
                              Map docs = jsonDecode(res.body);
                              await searchInPosts(docs.keys.toList());
                              // searchInPosts(res.body["id"] as List);
                            }
                          }
                        },
                        icon: Icon(
                          searching ? Icons.close : Icons.search,
                          color: Theme.of(context).colorScheme.primary,
                        ))
                  ],
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await postDialog(context, isAnUpdate: false);
              await getAllPosts();
            },
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                fixedSize: WidgetStateProperty.all(const Size(100, 30))),
            child: Text(
              "Create +",
              style: GoogleFonts.inter(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 20),
          // InkWell(
          //   onTap: () {},
          //   child: Image.asset("assets/icons/bell.png", height: 30, width: 30),
          // ),
          // const SizedBox(width: 20),
          // InkWell(
          //   onTap: () {},
          //   child:
          //       Image.asset("assets/icons/message.png", height: 30, width: 30),
          // ),
          // const SizedBox(width: 20),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
              // Navigator.pushNamed(context, '/profile');
            },
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser!.photoURL!)),
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffF7F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          SizedBox(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: el.length,
                              itemBuilder: (context, index) {
                                String txt = el.keys.elementAt(index);
                                AssetImage assetImage = el[txt]!;
                                return GestureDetector(
                                  onTap: () async {
                                    if (index == 0) {
                                      await getAllPosts();
                                    } else {
                                      await queryCollegeInPosts(
                                          el.keys.toList()[index]);
                                    }
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    decoration: BoxDecoration(
                                      // boxShadow: [
                                      //   index == selectedIndex
                                      //       ? BoxShadow(
                                      //           blurRadius: 5,
                                      //           spreadRadius: 2,
                                      //           offset: const Offset(0, 0),
                                      //           color: Theme.of(context)
                                      //               .colorScheme
                                      //               .primary
                                      //               .withOpacity(0.6))
                                      //       : const BoxShadow(
                                      //           blurRadius: 0, color: Colors.transparent)
                                      // ],
                                      borderRadius: BorderRadius.circular(5),
                                      color: index == selectedIndex
                                          ? Colors.grey.shade400
                                          : Colors.transparent,
                                    ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: assetImage,
                                          height: 20,
                                          width: 20,
                                          color: index == selectedIndex
                                              ? Colors.black
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        Text(txt,
                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: index == selectedIndex
                                                  ? Colors.black
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                            ))),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Followed topics",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.archivo(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                                const Divider(
                                  height: 20,
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                followedTopics.isEmpty
                                    ? SizedBox(
                                        height: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.touch_app_rounded,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              size: 70,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Tap on the topics in the post to add to followed topics",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                          itemCount: followedTopics.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return HashTagWidget(
                                                followedTopics[index]);
                                          },
                                        ),
                                      )
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("My Posts",
                                    style: GoogleFonts.archivo(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                                const Divider(
                                  height: 20,
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                recentPosts.isEmpty
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
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: recentPosts.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () async {
                                              await FirebaseFirestore.instance
                                                  .collection("posts")
                                                  .doc(recentPosts[index]["id"])
                                                  .get()
                                                  .then((doc) async {
                                                Map post = {
                                                  "id": doc.id,
                                                  "collaborator":
                                                      doc.get("collaborator"),
                                                  "collaborator_req": doc
                                                      .get("collaborator_req"),
                                                  "duration":
                                                      doc.get("duration"),
                                                  "expertise":
                                                      doc.get("expertise"),
                                                  "hashtags":
                                                      doc.get("hashtags"),
                                                  "meetingDetails":
                                                      doc.get("meetingDetails"),
                                                  "meetingLink":
                                                      doc.get("meetingLink"),
                                                  "n_comments":
                                                      doc.get("n_comments"),
                                                  "op_email":
                                                      doc.get("op_email"),
                                                  "op_name": doc.get("op_name"),
                                                  "op_profile":
                                                      doc.get("op_profile"),
                                                  "post": doc.get("post"),
                                                  "post_images":
                                                      doc.get("post_images"),
                                                  "timestamp":
                                                      doc.get("timestamp"),
                                                  "department":
                                                      doc.get("department"),
                                                  "college": doc.get("college"),
                                                  "position":
                                                      doc.get("position"),
                                                  "title": doc.get("title"),
                                                  "upvote": doc.get("upvote")
                                                };
                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();

                                                Map inviteDetails = {
                                                  "name": FirebaseAuth.instance
                                                      .currentUser!.displayName,
                                                  "bio":
                                                      "${prefs.getString("position")} at ${prefs.getString("department")}, ${prefs.getString("college")}",
                                                  "email": FirebaseAuth.instance
                                                      .currentUser!.email
                                                };
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PostPage(
                                                              post: post,
                                                              documentID:
                                                                  recentPosts[
                                                                          index]
                                                                      ["id"],
                                                              inviteDetails:
                                                                  inviteDetails,
                                                            )));
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05,
                                                      color: Colors.white,
                                                      child: recentPosts[index]
                                                                  ["photo"]
                                                              .isEmpty
                                                          ? Image.asset(
                                                              "assets/icons/gallery_Icon.png")
                                                          : Image.network(
                                                              recentPosts[index]
                                                                  ["photo"][0],
                                                              fit: BoxFit.cover,
                                                            ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.2 -
                                                              80,
                                                          child: Text(
                                                            recentPosts[index]
                                                                ["title"],
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .archivo(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "${recentPosts[index]["upvote"]} upvotes",
                                                          style: GoogleFonts
                                                              .archivo(
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "${recentPosts[index]["n_comments"]} comments",
                                                          style: GoogleFonts
                                                              .archivo(
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: Color(0xffdcdcdc),
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: loadingPosts
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Loading posts",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          )
                        : posts.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/images/empty-inbox.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "No posts availble.\nCreate a new post to get started",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              56,
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
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TabBar(
                                    controller: maintabcontroller,
                                    isScrollable: true,
                                    indicatorColor:
                                        Theme.of(context).colorScheme.primary,
                                    labelPadding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    tabs: [
                                      Tab(
                                          child: Text("Events",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)))),
                                      Tab(
                                          child: Text("Announcements",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)))),
                                    ])),
                            Expanded(
                              child: TabBarView(
                                controller: maintabcontroller,
                                children: const [
                                  Events(),
                                  Announcement(),
                                ],
                              ),
                            )
                          ]),
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
