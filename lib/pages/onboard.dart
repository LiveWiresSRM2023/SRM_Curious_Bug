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
  TextEditingController lastNameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    checkOnboard();
    setData();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    collegeController.dispose();
    departmentController.dispose();
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

  Future<void> saveToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "username", FirebaseAuth.instance.currentUser!.displayName ?? '');
    await prefs.setString(
        "imageUrl", FirebaseAuth.instance.currentUser!.photoURL ?? '');
    await prefs.setBool("onboard", true);
    checkOnboard();
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
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
          const SizedBox(height: 4),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.032,
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
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.09,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ),
              buildTextField(
                  controller: firstNameController, labelText: "First Name"),
              buildTextField(
                  controller: lastNameController, labelText: "Last Name"),
              buildTextField(
                  controller: collegeController, labelText: "College"),
              buildTextField(
                  controller: departmentController, labelText: "Department"),
              buildTextField(
                  controller: positionController, labelText: "Position"),
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
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString("username",
                      FirebaseAuth.instance.currentUser!.displayName!);
                  await prefs.setString(
                      "imageUrl", FirebaseAuth.instance.currentUser!.photoURL!);
                  await prefs.setBool("onboard", true);
                  checkOnboard();
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
            ],
          ),
        ),
      ),
    );
  }
}
