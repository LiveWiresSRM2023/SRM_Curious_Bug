import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/widgets/custom_textfield.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                  const CustomTextField(
                      borderColor: Color(0xffdcdcdc),
                      width: 300,
                      showLabel: true,
                      labelText: 'Name'),
                  const CustomTextField(
                      borderColor: Color(0xffdcdcdc),
                      width: 300,
                      showLabel: true,
                      labelText: 'College'),
                  const CustomTextField(
                      borderColor: Color(0xffdcdcdc),
                      width: 300,
                      showLabel: true,
                      labelText: 'Position in the department'),
                  const CustomTextField(
                      borderColor: Color(0xffdcdcdc),
                      width: 300,
                      showLabel: true,
                      labelText: 'Social Links'),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/feed');
                    },
                    splashColor: Colors.white.withOpacity(0.5),
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
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
            ),
          ),
        ),
      ),
    );
  }
}
