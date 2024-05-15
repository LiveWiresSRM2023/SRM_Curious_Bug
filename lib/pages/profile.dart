import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:srm_curious_bug/pages/feed/create.dart';
import 'package:srm_curious_bug/pages/feed/feed.dart';
import 'package:srm_curious_bug/widgets/custom_textfield.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width * 0.075,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          CustomTextField(
                              borderColor:
                                  Theme.of(context).colorScheme.primary,
                              width: double.maxFinite,
                              labelText: "Search",
                              leadingIcon: const Icon(Icons.search),
                              showLabel: false),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 8),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: FloatingActionButton.extended(
                        label: Text("Create +",
                            style: GoogleFonts.inter(color: Colors.white)),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Create();
                              });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.008),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/icons/notification 1.png",
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.008),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/icons/discussion.png",
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const Feed(),
                            transitionDuration: const Duration(seconds: 1),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.065,
                            height: MediaQuery.of(context).size.height * 0.065,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              shape: BoxShape.circle,
                              color: Colors.black45,
                            ),
                            // child: const CircleAvatar(
                            //     backgroundColor: Colors.white,
                            //     radius: 38,
                            //     backgroundImage:
                            //         AssetImage("assets/images/pfp.jpg")),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.02,
                            child: const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color(0xffdcdcdc),
                height: 1,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/Rectangle 14.png"),
                                              fit: BoxFit.fitWidth)),
                                    ),
                                    const Positioned(
                                      bottom: 1,
                                      left: 25,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 36,
                                          backgroundImage: AssetImage(
                                              "assets/images/pfp.jpg")),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text("Alex Job",
                                                  style: GoogleFonts.inter(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ))),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text("@alexjob145",
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ))),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text("UI/UX Designer",
                                              style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ))),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text(
                                                  "Chennai.TamilNadu.India",
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ))),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Text("Contact info",
                                                    style: GoogleFonts.inter(
                                                        textStyle:
                                                            const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.blue,
                                                    ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.055,
                                      width: MediaQuery.of(context).size.width *
                                          0.075,
                                      child: FloatingActionButton.extended(
                                        label: Text("Edit Profile",
                                            style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontSize: 12)),
                                        backgroundColor: Colors.black,
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                  height: 1,
                                  color: Color.fromARGB(255, 187, 185, 185)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text("About",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ReadMoreText(
                                          "Making magic on screens (UI/UX design) by day. When I'm off the clock, it's church, guitar jams, and good vibes. Love meeting new people. Always up to connect! Making magic on screens (UI/UX design) by day. When I'm off the clock, it's church, guitar jams, and good vibes. Love meeting new people. Always up to connect!Making magic on screens (UI/UX design) by day. When I'm off the clock, it's church, guitar jams, and good vibes. Love meeting new people. Always up to connect!",
                                          textAlign: TextAlign.start,
                                          trimLines: 5,
                                          trimCollapsedText: ' Show More',
                                          style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ))),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                  height: 1,
                                  color: Color.fromARGB(255, 187, 185, 185)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Activity",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ))),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.055,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.075,
                                        child: FloatingActionButton.extended(
                                          label: Text("Create +",
                                              style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                          backgroundColor: Colors.black,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return const Create();
                                                });
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //--------------include it in a listview builder----------
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text("Alex Job A",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text("posted this",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(" . 3w",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ))),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Image.asset(
                                                "assets/images/bluebells.jpg",
                                              )),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.53,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: ReadMoreText(
                                                "Had an amazing experience organizing Techutsav, An intra college event! Rocked the role of creative head, designing invitations, event details, banners, and backdrops. The Tech Innovation Challenge provided the perfect platform for us to unleash our creativity, problem-solving skills, and technical prowess. With fervor in our hearts and lines of code at our fingertips, we set out to tackle one of the most pressing issues of our time: transportation in urban landscapes.Big learning experience - leveled up my pressure management skills for sure! Plus, I met some super talented people along the way! 🔥✨",
                                                textAlign: TextAlign.justify,
                                                trimLines: 3,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText: ' Show More',
                                                style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const Divider(
                                        height: 1,
                                        color:
                                            Color.fromARGB(255, 187, 185, 185)),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ]),
                  ),
                  const VerticalDivider(
                    width: 1,
                  ),
                  const Expanded(
                    flex: 3,
                    child: Column(),
                  )
                ],
              ),
            ]),
      ),
      backgroundColor: Colors.white,
    );
  }
}
