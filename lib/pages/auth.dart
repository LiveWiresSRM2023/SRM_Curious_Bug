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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.3,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
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
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/srm_logo.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Explore, share and ignite your new research',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '"Dive into the Depths of Discovery: Unleash the Power of Research at your Fingertips"',
                    style: GoogleFonts.inter(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Sign In with Google',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0C4DA2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.white.withOpacity(0.5),
                        highlightColor: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google-icon.png',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                                width: 8), // Add space between text and image
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
