import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  List announcements = [
    {
      'title': 'Announcement 1',
      'content': 'This is the first announcement',
      'registration': ''
    },
    {
      'title': 'Announcement 2',
      'content': 'This is the second announcement',
      'registration': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height - 180,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: announcements.length,
                itemBuilder: (BuildContext context, int index) {
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
                                    announcements[index]["title"],
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            const SizedBox(height: 5),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: announcements[index]["content"],
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ])),
                            const SizedBox(height: 10),
                            TextButton(
                                onPressed: () async {
                                  Uri url = Uri.parse(
                                      announcements[index]["registration"]);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Unable to open the link"),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        Theme.of(context).colorScheme.primary),
                                    shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    fixedSize: WidgetStateProperty.all(
                                        const Size(double.maxFinite, 25))),
                                child: Text(
                                  "Open announcement link",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
          TextButton(
            onPressed: () async {
              TextEditingController announcementTitleController =
                  TextEditingController();

              TextEditingController announcementContentController =
                  TextEditingController();
              TextEditingController announcementRegistrationController =
                  TextEditingController();

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
                              "Create a new announcement",
                              style: GoogleFonts.inter(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close,
                                    size: 15,
                                    color:
                                        Theme.of(context).colorScheme.primary))
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
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextField(
                                  controller: announcementTitleController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter title here...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor),
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
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextField(
                                  maxLines: 2,
                                  controller: announcementContentController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your announcement here..',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor),
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
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextField(
                                  maxLines: 1,
                                  controller:
                                      announcementRegistrationController,
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
                                    hintText: 'Enter link',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor),
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
                              const SizedBox(height: 25),
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.black),
                                    shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    fixedSize: WidgetStateProperty.all(
                                        const Size(240, 30))),
                                child: Text(
                                  "Create Announcement",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  });
            },
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                fixedSize:
                    WidgetStateProperty.all(const Size(fullDegree - 74, 30))),
            child: Text(
              "Create Announcement",
              style: GoogleFonts.inter(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
