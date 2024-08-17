// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void editProfile(BuildContext context) {
  final Map<String, TextEditingController> profileInfo = {
    "About": TextEditingController(),
    "Degree": TextEditingController(),
    "GoogleScholar": TextEditingController(),
    "Research Gate link": TextEditingController(),
    "X": TextEditingController(),
    "Gmail": TextEditingController(),
    "Github": TextEditingController()
  };

  TextEditingController interestsController = TextEditingController();

  final List<double> textFieldConfig = [120, 40, 40, 40, 40, 40, 40];

  final List<List<dynamic>> profileIcons = [
    [Image.asset('assets/icons/about.png'), "About"],
    [Image.asset('assets/icons/degree.png'), "Degree"],
    [Image.asset('assets/icons/googlescholar_bg.png'), "Google Scholar"],
    [Image.asset('assets/icons/researchgate.png'), "Research Gate link"],
    [Image.asset('assets/icons/twitter.png'), "X"],
    [Image.asset('assets/icons/mail.png'), "Gmail"],
    [Image.asset('assets/icons/github.png'), "GitHub"],
  ];

  final List<String> departmentNames = [
    'Computer Applications',
    'Computer Science',
    'Mathematics',
    'Physics',
    'Chemistry',
    'Biology',
    'Humanities',
    'Law',
  ];

  // String department = 'Computer Applications';
  List<String> interests = [];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, dState) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0.0,
          content: SingleChildScrollView(
            child: SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 450,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Edit Your Profile here",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.archivo(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close,
                                size: 15,
                                color: Theme.of(context).colorScheme.primary))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: profileInfo.length,
                    itemBuilder: (BuildContext context, int index) {
                      String fieldHint = profileInfo.keys.elementAt(index);
                      TextEditingController controller =
                          profileInfo[fieldHint]!;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: textFieldConfig[index],
                              width: 450,
                              child: TextFormField(
                                minLines: 5,
                                maxLines: 6,
                                controller: controller,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: profileIcons[index][0],
                                  ),
                                  labelText: profileIcons[index][1],
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 0),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 450,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 240,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 40,
                                width: 180,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(fontSize: 14),
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: interestsController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(8),
                                    hintText: 'Add interests',

                                    filled: true,
                                    fillColor: Colors.grey[50],

                                    // suffix: IconButton(
                                    //   icon: const Icon(Icons.add),
                                    //   onPressed: () {
                                    //     dialogState(() {
                                    //       invities.add(
                                    //           invitesController.text);
                                    //     });
                                    //   },
                                    // ),
                                    hintStyle: GoogleFonts.archivo(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  color: Theme.of(context).colorScheme.primary,
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    dState(() {
                                      interests.insert(0, interestsController.text);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: 200,
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: interests.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    height: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            interests[index],
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 10,
                                          color: Colors.black,
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            dState(() {
                                              interests.remove(
                                                  interestsController.text);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 35,
                  //   width: 450,
                  //   child: Container(
                  //       decoration: BoxDecoration(
                  //         // labelStyle: TextStyle(
                  //         //     color: Theme.of(context).colorScheme.secondary),
                  //         // contentPadding: const EdgeInsets.symmetric(
                  //         //     vertical: 8.0, horizontal: 12.0),
                  //         borderRadius: BorderRadius.circular(5.0),
                  //         border:
                  //             Border.all(color: Colors.transparent, width: 0),
                  //         color: Colors.grey.shade200,
                  //       ),
                  //       child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Padding(
                  //               padding:
                  //                   const EdgeInsets.only(right: 11, left: 9),
                  //               child:
                  //                   Image.asset("assets/icons/department.png"),
                  //             ),
                  //             DropdownButtonHideUnderline(
                  //               child: DropdownButton<String>(
                  //                 icon: Padding(
                  //                   padding: const EdgeInsets.only(left: 205),
                  //                   child: Icon(Icons.arrow_drop_down,
                  //                       color: Theme.of(context)
                  //                           .colorScheme
                  //                           .primary),
                  //                 ),
                  //                 iconSize: 24,
                  //                 elevation: 16,
                  //                 style: GoogleFonts.inter(
                  //                     textStyle:
                  //                         const TextStyle(color: Colors.black)),
                  //                 dropdownColor: Colors.white,
                  //                 hint: Text('Select Department',
                  //                     style: GoogleFonts.inter(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.w500,
                  //                           color: Theme.of(context)
                  //                               .colorScheme
                  //                               .secondary),
                  //                     )),
                  //                 value:
                  //                     department, // Initially selected value or null
                  //                 onChanged: (String? newValue) {
                  //                   dState(() => department = newValue!);
                  //                 },
                  //                 items: departmentNames.map((String value) {
                  //                   return DropdownMenuItem<String>(
                  //                     value: value,
                  //                     child: Text(
                  //                       value,
                  //                       style: GoogleFonts.inter(
                  //                           textStyle:
                  //                               const TextStyle(fontSize: 16)),
                  //                     ),
                  //                   );
                  //                 }).toList(),
                  //               ),
                  //             ),
                  //           ])),
                  // ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString(
                          "about", profileInfo["About"]!.text);
                      await prefs.setString(
                          "degree", profileInfo["Degree"]!.text);
                      await prefs.setStringList("interests", interests);

                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser!.email)
                          .update({
                        "about": profileInfo["About"]!.text,
                        "degree": profileInfo["Degree"]!.text,
                        "scholar": profileInfo["GoogleScholar"]!.text,
                        "researchgate": profileInfo["Research Gate link"]!.text,
                        "x": profileInfo["X"]!.text,
                        "github": profileInfo["Github"]!.text,
                        "interests": interests
                      });
                      Navigator.pop(context);
                    },
                    splashColor: Colors.white.withOpacity(0.5),
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: GoogleFonts.archivo(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}
