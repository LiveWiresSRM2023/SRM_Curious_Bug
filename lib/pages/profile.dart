import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Wrap with Center widget
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFA8CBF6),
                  offset: Offset(0, 0),
                  blurRadius: 30,
                  spreadRadius: 7.0,
                )
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(
                  20), // Corrected border radius value // Set border color to blue
            ),
            height: screenSize.height * 0.88, // 80% of the screen height
            width: screenSize.width * 0.3, // 80% of the screen width
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Edit your Profile',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Image.asset(
                    'assets/images/srm_logo.png',
                    width: screenSize.height * 0.14,
                    height: screenSize.height * 0.14,
                  ),
                  const SizedBox(height: 4),
                  const ProfileTextField(labelText: 'Name'),
                  const ProfileTextField(labelText: 'College'),
                  const ProfileTextField(
                      labelText: 'Position in the department'),
                  const ProfileTextField(labelText: 'Social Links'),
                  const SizedBox(height: 5),
                  Column(
                    children: [
                      Text(
                        ' Sign In with Google ',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.white.withOpacity(0.5),
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 150,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0C4DA2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Continue',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                  width: 8), // Add space between text and image
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String labelText;

  const ProfileTextField({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        const SizedBox(height: 5),
        SizedBox(
          height: 33, // Reduced height
          width: 300,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide:
                    const BorderSide(color: Color.fromARGB(0, 197, 46, 46)),
              ),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
