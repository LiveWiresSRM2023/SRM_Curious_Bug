import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List events = [];
  bool eventsLoaded = false;
  Map<String, int> eV = {
    'Live': 0xFF85D358,
    'Ongoing': 0xBEFFD000,
    'Closed': 0xFFDE4540,
  };

  getEventsFromDB() async {
    await FirebaseFirestore.instance
        .collection("events")
        .get()
        .then((value) => setState(() {
              events.addAll(value.docs);
              eventsLoaded = true;
            }));
  }

  @override
  void initState() {
    getEventsFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Events",
                style: GoogleFonts.archivo(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
          ),
          SizedBox(
            // height: screenSize.height * 0.5,
            child: eventsLoaded
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      String key = eV.keys.elementAt(index);
                      int colorCode = eV[key]!;
                      Color color = Color(colorCode);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 228, 238, 247),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                        events[index]["title"],
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      height: 30,
                                      width: 60,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: color,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        key,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          letterSpacing: 0.8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       left: 5.0, right: 5, top: 2, bottom: 2),
                                    //   child: Container(
                                    //     alignment: Alignment.bottomRight,
                                    //     child: TextButton(
                                    //       onPressed: () {},
                                    //       style: TextButton.styleFrom(
                                    //         backgroundColor: color,
                                    //         shape: RoundedRectangleBorder(
                                    //           borderRadius:
                                    //               BorderRadius.circular(20.0),
                                    //         ),
                                    //       ),
                                    //       child: Padding(
                                    //         padding: const EdgeInsets.only(
                                    //             left: 4, right: 4, top: 1, bottom: 1),
                                    //         child: Text(
                                    //           key,
                                    //           style: const TextStyle(
                                    //             color: Colors.white,
                                    //             fontSize: 11.0,
                                    //             letterSpacing: 0.8,
                                    //             fontWeight: FontWeight.bold,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Venue: ",
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: events[index]["venue"],
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ])),
                                const SizedBox(height: 5),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Date: ",
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: events[index]["date"],
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ])),
                                const SizedBox(height: 5),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Timing: ",
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: events[index]["time"],
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ])),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
