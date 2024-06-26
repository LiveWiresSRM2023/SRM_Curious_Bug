import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/widgets/post_dialog.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/feed');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Container(
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/logo.png"))),
        ),
      ),
    ),
    centerTitle: true,
    title: SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.45,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          labelText: "Search",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          postDialog(context);
        },
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.black),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            fixedSize: WidgetStateProperty.all(const Size(100, 30))),
        child: Text(
          "Create +",
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(width: 20),
      InkWell(
        onTap: () {},
        child: Image.asset("assets/icons/bell.png", height: 30, width: 30),
      ),
      const SizedBox(width: 20),
      InkWell(
        onTap: () {},
        child: Image.asset("assets/icons/message.png", height: 30, width: 30),
      ),
      const SizedBox(width: 20),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/profile');
        },
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                backgroundImage:
                    NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)),
            const SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    ],
  );
}
