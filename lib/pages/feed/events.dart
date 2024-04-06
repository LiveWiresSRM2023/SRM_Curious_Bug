import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return ListView(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("UPCOMING EVENTS",
              style: GoogleFonts.archivo(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(
            // height: screenSize.height * 0.5,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 238, 247),
                      borderRadius: BorderRadius.circular(10.0),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 2,
                      //     blurRadius: 5,
                      //     offset: Offset(
                      //         0, 3),
                      //   ),
                      //],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Event Name : ABCD",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            "Venue : TP AUDI",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            "Date: ${DateTime.now().add(Duration(days: index)).toString().split(" ")[0]}",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          // Container(
                          //   alignment: Alignment.bottomRight,
                          //   child: OutlinedButton(
                          //     onPressed: () {},
                          //     style: OutlinedButton.styleFrom(
                          //       side: BorderSide(
                          //           color: Theme.of(context)
                          //               .primaryColor),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius:
                          //             BorderRadius.circular(8.0),
                          //       ),
                          //     ),
                          //     child: const Padding(
                          //       padding: EdgeInsets.all(2),
                          //       child: Text(
                          //         ' REGISTER ',
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 10.0,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // )
                          Container(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(1),
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          GestureDetector(
            onTap: () {
              // Handle onTap action
            },
            child: Text(
              "Show More",
              // textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
