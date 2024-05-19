import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/pages/feed/create.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/logo.png"))),
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
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.yellow.shade900),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    ),
    actions: [
      Container(
        alignment: Alignment.center,
        height: 35,
        width: 100,
        child: FloatingActionButton.extended(
          label:
              Text("Create +", style: GoogleFonts.inter(color: Colors.white)),
          backgroundColor: Colors.black,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  // List images = [];
                  // bool mediaUploaded = false;
                  // List<String> mediaUrl = [];
                  return const Create();
                });
          },
          //mini: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          // icon: const Icon(Icons.add),
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
        child: const Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                backgroundImage: AssetImage("assets/images/pfp.jpg")),
            SizedBox(
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
