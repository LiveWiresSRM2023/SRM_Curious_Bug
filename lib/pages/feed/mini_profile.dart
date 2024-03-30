import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniProfile extends StatefulWidget {
  const MiniProfile({super.key});

  @override
  State<MiniProfile> createState() => _MiniProfileState();
}

class _MiniProfileState extends State<MiniProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Container(margin: const EdgeInsets.only(bottom: 70), child: buildTop()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text("SRM UNIVERSITY",
                  style: GoogleFonts.archivo(
                      textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text(
            "Software Engineer | Full Stack Developer | Open to Opportunities|Passionate software engineer with 5+ years of experience in full-stack web development. Skilled in JavaScript, React.js, Node.js, and MongoDB. Dedicated to creating scalable and efficient solutions to complex problems. Currently seeking new opportunities to contribute my expertise to innovative projects",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            textAlign: TextAlign.center,
          )),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("FOLLOWED HASHTAGS",
                  style: GoogleFonts.archivo(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              SizedBox(
                  height: 10, width: MediaQuery.of(context).size.width * 0.5),
              const Divider(
                height: 0.20,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              const Wrap(
                alignment: WrapAlignment.center,
                children: [
                  HashTagWidget('#twitter'),
                  HashTagWidget('#srm'),
                  HashTagWidget('#mobiledev'),
                  HashTagWidget('#srmist'),
                  HashTagWidget('#ig'),
                  HashTagWidget('#srmist'),
                  HashTagWidget('#hello:)'),
                  HashTagWidget('#srmist'),
                  HashTagWidget('#twitter'),
                  HashTagWidget('#srm'),
                  HashTagWidget('#mobiledev'),
                  HashTagWidget('#srmist'),
                  HashTagWidget('#ig'),
                  HashTagWidget('#srmist'),
                ],
              ),
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
              Text("MY POSTS",
                  style: GoogleFonts.archivo(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              SizedBox(
                  height: 10, width: MediaQuery.of(context).size.width * 0.5),
              const Divider(
                height: 0.20,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8.0),
                              width: 80,
                              height: 52,
                              color: Colors.white,
                              child: Image.asset(
                                "assets/images/bluebells.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "How I make cool designs?\nLet me tell you :)",
                                    style: GoogleFonts.archivo(
                                      textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "8,123 viewers",
                                    style: GoogleFonts.archivo(
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
      ]),
    );
  }

  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "images/bg_white.jpg",
            height: 100,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 50,
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                "assets/images/srm_logo.png",
              ),
            ),
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
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 214, 193, 121),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          tag,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
