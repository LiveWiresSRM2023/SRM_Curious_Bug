import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  Map<String, int> eV = {
    'Live': 0xFF85D358,
    'Closed': 0xFFDE4540,
    'Ongoing': 0xBEFFD000,
  };

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return ListView(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(153, 233, 230, 226),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
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
                child: ListView.builder(
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
                                  Text(
                                    "Meet 0${index + 1}",
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5, top: 2, bottom: 2),
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: color,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4,
                                              right: 4,
                                              top: 1,
                                              bottom: 1),
                                          child: Text(
                                            key,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.0,
                                              letterSpacing: 0.8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                "Venue  :       srm",
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                "Date     :       ${DateTime.now().add(Duration(days: index)).toString().split(" ")[0]}",
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                "Timing  :       ${DateTime.now().add(Duration(days: index)).toString().split(" ")[1].split(".")[0]}",
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
