import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HashTagWidget extends StatelessWidget {
  final String tag;

  const HashTagWidget(this.tag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          "# $tag",
          style: GoogleFonts.inter(
              textStyle: const TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ),
    );
  }
}