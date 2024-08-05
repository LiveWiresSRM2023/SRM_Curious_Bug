// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void editProfile(BuildContext context) {
  final Map<String, TextEditingController> profileInfo = {
    "About": TextEditingController(),
    "Degree": TextEditingController(),
    // "Department": TextEditingController(),
    "Github": TextEditingController(),
    "Gmail": TextEditingController(),
    "GoogleScholar": TextEditingController(),
    "Website": TextEditingController(),
  };
  // final Map<String, AssetImage> profileIcons = {
  //   "About": const AssetImage('assets/icons/about.png'),
  //   "Degree": const AssetImage('assets/icons/degree.png'),
  //   // "Department": TextEditingController(),
  //   "Github": const AssetImage('assets/icons/github_yellow.png'),
  //   "Gmail": const AssetImage('assets/icons/mail.png'),
  //   "GoogleScholar": const AssetImage('assets/icons/scholar.png'),
  //   "Website": const AssetImage('assets/icons/website.png'),
  // };
  final List<List<dynamic>> profileIcons = [
    [Image.asset('assets/icons/about.png'), "About"],
    [Image.asset('assets/icons/degree.png'), "Degree"],
    [Image.asset('assets/icons/github_yellow.png'), "Github"],
    [Image.asset('assets/icons/mail.png'), "Gmail"],
    [Image.asset('assets/icons/googlescholar_bg.png'), "Google Scholar"],
    [Image.asset('assets/icons/website.png'), "Website"],
  ];
  final List<String> departmentNames = [
    'Humanities',
    'Computer Science',
    'Law',
    'Computer Applications',
    'Mathematics'
  ];

  showDialog(
    context: context,
    builder: (BuildContext context) {
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
                  child: Text(
                    "Edit Your Profile here...",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.archivo(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: profileIcons.length,
                  itemBuilder: (BuildContext context, int index) {
                    String fieldHint = profileInfo.keys.elementAt(index);
                    TextEditingController controller = profileInfo[fieldHint]!;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 450,
                            child: TextFormField(
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
                  height: 35,
                  width: 450,
                  child: Container(
                      decoration: BoxDecoration(
                        // labelStyle: TextStyle(
                        //     color: Theme.of(context).colorScheme.secondary),
                        // contentPadding: const EdgeInsets.symmetric(
                        //     vertical: 8.0, horizontal: 12.0),
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.transparent, width: 0),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 11, left: 9),
                              child: Image.asset("assets/icons/department.png"),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 205),
                                  child: Icon(Icons.arrow_drop_down,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: GoogleFonts.inter(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                dropdownColor: Colors.white,
                                hint: Text('Select Department',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    )),
                                value: null, // Initially selected value or null
                                onChanged: (String? newValue) {
                                  // Handle dropdown value change
                                },
                                items: departmentNames.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: GoogleFonts.inter(
                                          textStyle:
                                              const TextStyle(fontSize: 16)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ])),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
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
    },
  );
}
