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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.15),
              child: buildTop()),
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
              style: GoogleFonts.archivo(
                textStyle: const TextStyle(
                    fontSize: 15,
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
                                width: MediaQuery.of(context).size.height * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
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
                                      "How i make cool designs?\nLet me tell you :)",
                                      style: GoogleFonts.archivo(
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04),
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
      ),
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
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          child: const CircleAvatar(
            radius: 60,
            backgroundColor: Color.fromARGB(255, 217, 214, 214),
            backgroundImage: AssetImage(
              "assets/images/srm_logo.png",
            ),
          ),
        ),
      ],
    );
  }
}

class HashTagWidget extends StatelessWidget {
  final String tag;

  const HashTagWidget(this.tag);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 214, 193, 121),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          tag,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
