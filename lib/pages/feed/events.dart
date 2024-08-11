import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  TextEditingController eventstartDatePicker = TextEditingController();
  List events = [];
  bool eventsLoaded = false;

  Map<String, int> eV = {
    'Live': 0xFF85D358,
    'Ongoing': 0xBEFFD000,
    'Closed': 0xFFDE4540,
  };

  getEventsFromDB() async {
    await FirebaseFirestore.instance.collection("events").get().then((value) {
      events.addAll(value.docs);
    });
    setState(() {
      eventsLoaded = true;
    });
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Events",
                  style: GoogleFonts.archivo(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              TextButton(
                onPressed: () async {
                  TextEditingController eventTitleController =
                      TextEditingController();
                  TextEditingController eventStartDatePicker =
                      TextEditingController();
                  TextEditingController eventVenueController =
                      TextEditingController();
                  TextEditingController eventRegistrationController =
                      TextEditingController();
                  TextEditingController eventstartTimePicker =
                      TextEditingController();
                  TextEditingController eventendTimePicker =
                      TextEditingController();
                  String eventStartTime = '';
                  String eventEndTime = '';
                  String eventDate = '';
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, dState) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Create a new event",
                                  style: GoogleFonts.inter(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.close,
                                        size: 15,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary))
                              ],
                            ),
                            content: SizedBox(
                              // height: double
                              //     .minPositive,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: TextField(
                                      controller: eventTitleController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter event name',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 179, 177, 177)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: TextField(
                                      maxLines: 1,
                                      controller: eventVenueController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter venue of the event',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 179, 177, 177)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: TextField(
                                      maxLines: 1,
                                      controller: eventRegistrationController,
                                      decoration: InputDecoration(
                                        suffixIcon: Transform.rotate(
                                          angle: 90,
                                          child: Icon(
                                            Icons.link,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        hintText: 'Enter registration link',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 179, 177, 177)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text("Date of the event : ",
                                            style: GoogleFonts.archivo(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary))),
                                        const Spacer(),
                                        SizedBox(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2) -
                                              10,
                                          child: TextField(
                                            controller: eventStartDatePicker,
                                            onTap: () async {
                                              DateTime? datetime =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(2024),
                                                      lastDate: DateTime(2050));
                                              if (datetime != null) {
                                                String formattedDate =
                                                    DateFormat('dd-mm-yyyy')
                                                        .format(datetime);
                                                setState(() {
                                                  eventStartDatePicker.text =
                                                      formattedDate;
                                                  eventDate =
                                                      formattedDate.toString();
                                                });
                                              }
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(
                                                Icons.date_range,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              hintText: 'Event date',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 179, 177, 177)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          // height:
                                          //     32,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2) -
                                              10,
                                          child: TextField(
                                            controller: eventstartTimePicker,
                                            onTap: () async {
                                              TimeOfDay? timeOfDay =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              );
                                              if (timeOfDay != null) {
                                                final now = DateTime.now();
                                                final dateTime = DateTime(
                                                    now.year,
                                                    now.month,
                                                    now.day,
                                                    timeOfDay.hour,
                                                    timeOfDay.minute);
                                                String formattedTime =
                                                    DateFormat('HH:mm:ss')
                                                        .format(dateTime);
                                                setState(() {
                                                  eventstartTimePicker.text =
                                                      formattedTime;
                                                  eventStartTime =
                                                      timeOfDay.format(context);
                                                });
                                              }
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(
                                                Icons.access_time,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              hintText: 'Start time',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 179, 177, 177)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // height:
                                          //     32,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2) -
                                              10,
                                          child: TextField(
                                            controller: eventendTimePicker,
                                            onTap: () async {
                                              TimeOfDay? timeOfDay =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              );
                                              if (timeOfDay != null) {
                                                final now = DateTime.now();
                                                final dateTime = DateTime(
                                                    now.year,
                                                    now.month,
                                                    now.day,
                                                    timeOfDay.hour,
                                                    timeOfDay.minute);
                                                String formattedTime =
                                                    DateFormat('HH:mm:ss')
                                                        .format(dateTime);
                                                setState(() {
                                                  eventendTimePicker.text =
                                                      formattedTime;
                                                  eventEndTime =
                                                      timeOfDay.format(context);
                                                });
                                              }
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(
                                                Icons.access_time,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              hintText: 'End time',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 179, 177, 177)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  TextButton(
                                    onPressed: () async {
                                      Map<String, String> eventDetails = {
                                        "date": eventDate,
                                        "time": eventStartTime,
                                        "title": eventTitleController.text,
                                        "venue": eventVenueController.text
                                      };
                                      await FirebaseFirestore.instance
                                          .collection("events")
                                          .doc()
                                          .set(eventDetails);
                                      setState(() {
                                        events.add(eventDetails);
                                      });
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                Colors.black),
                                        shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        fixedSize: WidgetStateProperty.all(
                                            const Size(180, 30))),
                                    child: Text(
                                      "Create Event",
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          );
                        });
                      }).then((v) {
                    print(v);
                  });
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    fixedSize: WidgetStateProperty.all(const Size(135, 30))),
                child: Text(
                  "Create Events",
                  style: GoogleFonts.inter(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
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
                                    // Container(
                                    //   height: 30,
                                    //   width: 60,
                                    //   alignment: Alignment.center,
                                    //   decoration: BoxDecoration(
                                    //       color: color,
                                    //       borderRadius:
                                    //           BorderRadius.circular(20)),
                                    //   child: Text(
                                    //     key,
                                    //     style: const TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 11.0,
                                    //       letterSpacing: 0.8,
                                    //       fontWeight: FontWeight.bold,
                                    //     ),
                                    //   ),
                                    // )
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
