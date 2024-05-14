import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_curious_bug/pages/feed/create.dart';
import 'package:srm_curious_bug/widgets/custom_textfield.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              //flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width * 0.075,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          CustomTextField(
                              borderColor:
                                  Theme.of(context).colorScheme.primary,
                              width: double.maxFinite,
                              labelText: "Search",
                              leadingIcon: const Icon(Icons.search),
                              showLabel: false),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 8),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: FloatingActionButton.extended(
                        label: Text("Create +",
                            style: GoogleFonts.inter(color: Colors.white)),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
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
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.008),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/icons/notification 1.png",
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.008),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/icons/discussion.png",
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/profile');
                      },
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.047,
                            height: MediaQuery.of(context).size.height * 0.047,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              shape: BoxShape.circle,
                              color: Colors.black45,
                            ),
                            // child: ClipOval(
                            //   child: Image.asset(
                            //     "assets/images/bluebells.jpg",
                            //     width: MediaQuery.of(context).size.width * 0.02,
                            //     height:
                            //         MediaQuery.of(context).size.height * 0.02,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.02,
                            child: const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffdcdcdc),
              height: 1,
            ),
          ]),
      backgroundColor: Colors.white,
    );
  }
}
