// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

editProfile(BuildContext context) {
  TextEditingController aboutcontroller = TextEditingController();
  TextEditingController degreecontroller = TextEditingController();
  TextEditingController deptcontroller = TextEditingController();
  TextEditingController gitcontroller = TextEditingController();
  TextEditingController gmailcontroller = TextEditingController();
  TextEditingController gscholarcontroller = TextEditingController();
  TextEditingController websitecontroller = TextEditingController();
  Map profileInfo = {
    "About ": aboutcontroller,
    "Degree": degreecontroller,
    "Department": deptcontroller,
    "Github": gitcontroller,
    "Gmail": gmailcontroller,
    "GoogleScholar": gscholarcontroller,
    "Website": websitecontroller,
  };

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 0.0,
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter dialogState) {
              var screenSize = MediaQuery.of(context).size;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 500,
                    child: Center(
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: profileInfo.length,
                              itemBuilder: (BuildContext context, int index) {
                                String fieldhint =
                                    profileInfo.keys.elementAt(index);
                                TextEditingController cl =
                                    profileInfo[fieldhint];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "$fieldhint : ",
                                          style: GoogleFonts.openSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                    .withOpacity(0.2),
                                                blurRadius: 7,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            controller: cl,
                                            textAlign: TextAlign.start,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                            ),
                                            autofocus: true,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            cursorWidth:
                                                screenSize.width * 0.001,
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .secondary
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            splashColor: Colors.white.withOpacity(0.5),
                            highlightColor: Colors.transparent,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffDe9a3a),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "Save",
                                    style: GoogleFonts.archivo(
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
      });
}
