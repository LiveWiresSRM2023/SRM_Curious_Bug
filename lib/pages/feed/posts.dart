import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Post extends StatelessWidget {
  final List posts;
  const Post({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: ((context, index) {
        return Padding(
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
                                image:
                                    NetworkImage(posts[index]["op_profile"]))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        posts[index]["op_name"],
                        style: GoogleFonts.archivo(
                          fontSize: 15,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text("·"),
                      ),
                      Text(
                        "${DateTime.now().difference(DateTime.parse(posts[index]["timestamp"])).inDays}D",
                        style: GoogleFonts.archivo(
                            fontSize: 15, color: const Color(0xff5b7083)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    posts[index]["title"],
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    posts[index]["post"],
                    style: GoogleFonts.inter(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  posts[index]["post_images"].length > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 500,
                              height: 200,
                              child: CarouselSlider(
                                  items: List.generate(
                                      posts[index]["post_images"].length,
                                      (imageIndex) => Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        posts[index]
                                                                ["post_images"]
                                                            [imageIndex]))),
                                          )),
                                  options: CarouselOptions(
                                      autoPlay: false,
                                      height: 200,
                                      enlargeCenterPage: true)),
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
                          onTap: () {
                            //TODO: Implement firestore update
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        Text(posts[index]["upvote"]),
                        InkWell(
                          onTap: () {
                            // TODO: Implement firestore update
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
                        Text(posts[index]["n_comments"].toString()),
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
        );
      }),
    );
  }
}
