import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
          child: ListView(children: <Widget>[
            Container(
              // height: screenSize.height * 0.95,
              width: screenSize.width * 0.5,
              // alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 228, 228),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("UPCOMING EVENTS",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Event Name : ABCD",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                "Venue : TP AUDI",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                "Date: ${DateTime.now().add(Duration(days: index)).toString().split(" ")[0]}",
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              GestureDetector(
                                onTap: () {
                                  // Handle onTap action
                                },
                                child: Text(
                                  "Register Now",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const Divider(color: Colors.grey),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
