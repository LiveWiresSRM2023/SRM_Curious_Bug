import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;
  Map<String, IconData> el = {
    'Home': Icons.home_rounded,
    'Events': Icons.event_seat_sharp,
    'Calendar': Icons.calendar_month,
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              String txt = el.keys.elementAt(index);
              IconData iconData = el[txt]!;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   index == selectedIndex
                    //       ? BoxShadow(
                    //           blurRadius: 5,
                    //           spreadRadius: 2,
                    //           offset: const Offset(0, 0),
                    //           color: Theme.of(context)
                    //               .colorScheme
                    //               .primary
                    //               .withOpacity(0.6))
                    //       : const BoxShadow(
                    //           blurRadius: 0, color: Colors.transparent)
                    // ],
                    borderRadius: BorderRadius.circular(5),
                    color: index == selectedIndex
                        ? Colors.grey.shade400
                        : Colors.transparent,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        iconData,
                        color: index == selectedIndex
                            ? Colors.black
                            : Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Text(txt,
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: index == selectedIndex
                                ? Colors.black
                                : Theme.of(context).colorScheme.primary,
                          ))),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Followed Hashtags",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.archivo(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              const SizedBox(height: 10),
              const Divider(
                height: 0.20,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HashTagWidget(' Science'),
                  HashTagWidget(' UI'),
                  HashTagWidget(' User experience'),
                  HashTagWidget(' Python'),
                  HashTagWidget(' srmist'),
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
              Text("My Posts",
                  style: GoogleFonts.archivo(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              const SizedBox(height: 10),
              const Divider(
                height: 0.20,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.white,
                            child: Image.asset(
                              "assets/images/bluebells.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Headline",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.archivo(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  "8,123 viewers",
                                  style: GoogleFonts.archivo(
                                    textStyle: const TextStyle(
                                      fontSize: 10,
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
                  );
                },
              ),
            ],
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
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          "# $tag",
          style: GoogleFonts.inter(
              textStyle: const TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ),
    );
  }
}
