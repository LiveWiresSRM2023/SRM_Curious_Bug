import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController googleScholarController = TextEditingController();
  TextEditingController researchGateController = TextEditingController();
  TextEditingController xController = TextEditingController();
  TextEditingController githubController = TextEditingController();

  bool isChecked = false;
  String department = "Computer Applications";
  List<String> departmentNames = [
    "Computer Applications",
    "Computer Science",
    "Biochemistry",
    "Biotechnology",
    "Chemistry",
    "Commerce",
    "Economics",
    "Mathematics",
    "Mathematics and Statistics",
    "Visual Communications",
    "CDC",
  ];

  String college = "Science";
  List<String> collegeNames = ["Science", "Humanities", "Business", "Law"];

  @override
  void initState() {
    super.initState();
    checkOnboard();
    setData();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    degreeController.dispose();
    positionController.dispose();
    super.dispose();
  }

  void checkOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("onboard")) {
      Navigator.pushReplacementNamed(context, "/feed");
    }
  }

  void setData() {
    firstNameController.text =
        FirebaseAuth.instance.currentUser!.displayName ?? '';
  }

  Widget buildTextField(
      {required TextEditingController controller,
      required String labelText,
      String? hintText}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  blurRadius: 7,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: TextField(
                controller: controller,
                textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                autofocus: true,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                cursorWidth: MediaQuery.of(context).size.width * 0.001,
                cursorColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade100,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                    ),
                  ),
                ),
              ),
              buildTextField(
                  controller: firstNameController, labelText: "Name"),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "College",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300,
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(5),
                    focusColor: Colors.grey.shade300,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 205),
                      child: Icon(Icons.arrow_drop_down,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(color: Colors.black)),
                    dropdownColor: Colors.white,
                    hint: Text(
                      'Select College',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    value: college, // Initially selected value or null
                    onChanged: (String? newValue) {
                      setState(() => college = newValue!);
                    },
                    items: collegeNames.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Department",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300,
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(5),
                    focusColor: Colors.grey.shade300,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 205),
                      child: Icon(Icons.arrow_drop_down,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(color: Colors.black)),
                    dropdownColor: Colors.white,
                    hint: Text(
                      'Select Department',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    value: department, // Initially selected value or null
                    onChanged: (String? newValue) {
                      setState(() => department = newValue!);
                    },
                    items: departmentNames.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              buildTextField(
                hintText: "PhD in Computer Science",
                controller: degreeController, labelText: "Degree"),
              buildTextField(
                hintText: "Professor",
                  controller: positionController, labelText: "Position"),
              buildTextField(
                  hintText: "https://www.googlescholar.com",
                  controller: googleScholarController,
                  labelText: "Google Scholar"),
              buildTextField(
                  hintText: "https://www.researchgate.com",
                  controller: researchGateController,
                  labelText: "ResearchGate"),
              buildTextField(
                  hintText: "https://www.x.com",
                  controller: xController,
                  labelText: "X"),
              buildTextField(
                  hintText: "https://www.github.com/LiveWiresSRM2023",
                  controller: githubController,
                  labelText: "GitHub"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (newValue) =>
                        setState(() => isChecked = newValue ?? false),
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    "I agree to the Terms of Service and acknowledge the Privacy Policy",
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 9,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () async {
                  if (isChecked &&
                      firstNameController.text.isNotEmpty &&
                      degreeController.text.isNotEmpty &&
                      positionController.text.isNotEmpty) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setString("name",
                        FirebaseAuth.instance.currentUser!.displayName!);
                    // await prefs.setString("imageUrl",
                    //     FirebaseAuth.instance.currentUser!.photoURL!);
                    await prefs.setString("department", department);
                    await prefs.setString("degree", degreeController.text);
                    await prefs.setString(
                        "researchgate", researchGateController.text);
                    await prefs.setString("github", githubController.text);
                    await prefs.setString(
                        "scholar", googleScholarController.text);
                    await prefs.setString("x", xController.text);
                    await prefs.setString("college", college);
                    await prefs.setString("position", positionController.text);
                    await prefs.setStringList("interests", []);
                    await prefs.setString("about",
                        "${positionController.text} at $department, $college");
                    await prefs.setString("userImage",
                        FirebaseAuth.instance.currentUser!.photoURL!);
                    await prefs.setBool("onboard", true);
                    try {
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser!.email)
                          .set({
                        "name": FirebaseAuth.instance.currentUser!.displayName,
                        "about":
                            "${positionController.text} at $department, $college",
                        "userImage":
                            FirebaseAuth.instance.currentUser!.photoURL!,
                        "college": college,
                        "department": department,
                        "position": positionController.text,
                        "website": websiteController.text,
                        "degree": degreeController.text,
                        "scholar": googleScholarController.text,
                        "researchgate": researchGateController.text,
                        "x": xController.text,
                        "email": FirebaseAuth.instance.currentUser!.email,
                        "github": githubController.text,
                        "interests": []
                      }).whenComplete(() {
                        checkOnboard();
                      });
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Error missing fields")));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  fixedSize: WidgetStateProperty.all(const Size(100, 30)),
                ),
                child: Text(
                  "Continue",
                  style: GoogleFonts.inter(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
