// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void editProfile(BuildContext context) {
  final Map<String, TextEditingController> profileInfo = {
    "About": TextEditingController(),
    "Degree": TextEditingController(),
    "Department": TextEditingController(),
    "Github": TextEditingController(),
    "Gmail": TextEditingController(),
    "GoogleScholar": TextEditingController(),
    "Website": TextEditingController(),
  };

  showDialog(
    context: context,
    builder: (BuildContext context) {
      var screenSize = MediaQuery.of(context).size;
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: profileInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    String fieldHint = profileInfo.keys.elementAt(index);
                    TextEditingController controller = profileInfo[fieldHint]!;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$fieldHint : ",
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 40,
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
                              controller: controller,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              cursorWidth: screenSize.width * 0.001,
                              cursorColor: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
