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
                      Image.asset(
                        "assets/images/srm_logo.png",
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "SRM INSTITUTE",
                        style: GoogleFonts.archivo(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("·"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "23s",
                        style: GoogleFonts.archivo(
                            fontSize: 15, color: const Color(0xff5b7083)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Title of the project",
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "An excellent platform for developing and strengthening your research. It can increase your productivity as an individual, even as it allows you to rise your profile.",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
