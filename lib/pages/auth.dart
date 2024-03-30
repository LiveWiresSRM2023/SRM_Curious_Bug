import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            height: screenSize.height * 0.88, // 80% of the screen height
            width: screenSize.width * 0.29,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  offset: const Offset(0, 0),
                  blurRadius: 30,
                  spreadRadius: 7.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/srm_logo.png',
                    width: screenSize.height * 0.18,
                    height: screenSize.height * 0.18,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Explore, share and ignite your\n new research',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '"Dive into the Depths of Discovery: Unleash the Power of Research at your Fingertips"',
                      style: GoogleFonts.inter(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Sign In with Google',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 159,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/profile');
                        },
                        splashColor: Colors.white.withOpacity(0.5),
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/google-icon.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              const SizedBox(
                                  width: 2), // Add space between text and image
                              Text(
                                'Google',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
