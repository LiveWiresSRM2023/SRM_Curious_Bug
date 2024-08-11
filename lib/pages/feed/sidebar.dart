import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srm_curious_bug/pages/post_page.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;
  Map<String, AssetImage> el = {
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

  @override
  void initState() {
    loadFollowedTopics();
    loadRecentPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.07,
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
                            : Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Text(txt,
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: index == selectedIndex
                                ? Colors.black
                                : Theme.of(context).colorScheme.primary,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.touch_app_rounded,
                            color: Theme.of(context).colorScheme.primary,
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
                          return HashTagWidget(followedTopics[index]);
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.post_add_outlined,
                            color: Theme.of(context).colorScheme.primary,
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
                                "department": doc.get("department"),
                                "college": doc.get("college"),
                                "position": doc.get("position"),
                                "title": doc.get("title"),
                                "upvote": doc.get("upvote")
                              };
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              Map inviteDetails = {
                                "name": FirebaseAuth
                                    .instance.currentUser!.displayName,
                                "bio":
                                    "${prefs.getString("position")} at ${prefs.getString("department")}, ${prefs.getString("college")}",
                                "email":
                                    FirebaseAuth.instance.currentUser!.email
                              };
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostPage(
                                            post: post,
                                            documentID: recentPosts[index]
                                                ["id"],
                                            inviteDetails: inviteDetails,
                                          )));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                    color: Colors.white,
                                    child: recentPosts[index]["photo"].isEmpty
                                        ? Image.asset(
                                            "assets/icons/gallery_Icon.png")
                                        : Image.network(
                                            recentPosts[index]["photo"][0],
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                    0.2 -
                                                80,
                                        child: Text(
                                          recentPosts[index]["title"],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.archivo(
                                            textStyle: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${recentPosts[index]["upvote"]} upvotes",
                                        style: GoogleFonts.archivo(
                                          textStyle: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${recentPosts[index]["n_comments"]} comments",
                                        style: GoogleFonts.archivo(
                                          textStyle: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
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
    );
  }
}

class HashTagWidget extends StatelessWidget {
  final String tag;

  const HashTagWidget(this.tag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          "# $tag",
          style: GoogleFonts.inter(
              textStyle: const TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ),
    );
  }
}
