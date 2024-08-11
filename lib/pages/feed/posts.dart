import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srm_curious_bug/pages/post_page.dart';

class Post extends StatefulWidget {
  List posts;
  Post({super.key, required this.posts});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length,
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () async {
            // print(widget.posts[index]);
            SharedPreferences prefs = await SharedPreferences.getInstance();

            Map inviteDetails = {
              "name": FirebaseAuth.instance.currentUser!.displayName,
              "bio":
                  "${prefs.getString("position")} at ${prefs.getString("department")}, ${prefs.getString("college")}",
              "email": FirebaseAuth.instance.currentUser!.email
            };
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostPage(
                  post: widget.posts[index],
                  documentID: widget.posts[index]["id"],
                  inviteDetails: inviteDetails,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      widget.posts[index]["op_profile"]))),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.posts[index]["op_name"],
                          style: GoogleFonts.archivo(
                            fontSize: 15,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text("·"),
                        ),
                        Text(
                          "${DateTime.now().difference(DateTime.parse(widget.posts[index]["timestamp"])).inDays}D",
                          style: GoogleFonts.archivo(
                              fontSize: 15, color: const Color(0xff5b7083)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.posts[index]["title"],
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.posts[index]["post"],
                      style: GoogleFonts.inter(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    widget.posts[index]["post_images"].length > 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 500,
                                height: 200,
                                child: CarouselView(
                                    itemSnapping: false,
                                    shrinkExtent: 10,
                                    itemExtent: 400,
                                    children: List.generate(
                                        widget
                                            .posts[index]["post_images"].length,
                                        (imageIndex) => Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(widget
                                                                  .posts[index]
                                                              ["post_images"]
                                                          [imageIndex]))),
                                            ))),
                              ),
                            ],
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              int updatedUpvote =
                                  widget.posts[index]["upvote"] + 1;
                              await FirebaseFirestore.instance
                                  .collection("posts")
                                  .doc(widget.posts[index]["id"])
                                  .update({"upvote": updatedUpvote});
                              setState(() {
                                widget.posts[index]["upvote"] = updatedUpvote;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          Text(widget.posts[index]["upvote"].toString()),
                          InkWell(
                            onTap: () async {
                              if (widget.posts[index]["upvote"] > 0) {
                                int updatedUpvote =
                                    widget.posts[index]["upvote"] - 1;
                                await FirebaseFirestore.instance
                                    .collection("posts")
                                    .doc(widget.posts[index]["id"])
                                    .update({"upvote": updatedUpvote});
                                setState(() {
                                  widget.posts[index]["upvote"] = updatedUpvote;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Theme.of(context).colorScheme.primary,
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
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(widget.posts[index]["n_comments"].toString()),
                          const SizedBox(
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.ios_share,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const Text("Share")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
