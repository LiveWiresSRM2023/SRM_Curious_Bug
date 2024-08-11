// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:srm_curious_bug/pages/profile.dart';
// import 'package:srm_curious_bug/widgets/post_dialog.dart';

// PreferredSizeWidget appBar(BuildContext context) {
//   TextEditingController searchController = TextEditingController();
//   String url = "http://10.9.31.214:80";
//   final List<String> filterNames = [
//     'Hashtags',
//     'Posts',
//   ];
//   return AppBar(
//     elevation: 0,
//     leading: InkWell(
//       onTap: () {
//         Navigator.pushReplacementNamed(context, '/feed');
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Container(
//           decoration: const BoxDecoration(
//               image:
//                   DecorationImage(image: AssetImage("assets/images/logo.png"))),
//         ),
//       ),
//     ),
//     centerTitle: true,
//     title: SizedBox(
//       height: 40,
//       width: MediaQuery.of(context).size.width * 0.45,
//       child: TextFormField(
//         controller: searchController,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(Icons.search),
//           labelText: "Search",
//           suffixIcon: SizedBox(
//             width: 140,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Icon(Icons.sort,
//                         //     color: Theme.of(context).colorScheme.primary),
//                         DropdownButtonHideUnderline(
//                           child: DropdownButton<String>(
//                             icon: Padding(
//                               padding: const EdgeInsets.only(left: 1),
//                               child: Icon(Icons.sort,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary),
//                             ),
//                             iconSize: 20,
//                             elevation: 10,
//                             style: GoogleFonts.inter(
//                                 textStyle:
//                                     const TextStyle(color: Colors.black)),
//                             dropdownColor: Colors.grey[200],
//                             hint: Text('filter',
//                                 style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .secondary),
//                                 )),
//                             value: null, // Initially selected value or null
//                             onChanged: (String? newValue) {
//                               // Handle dropdown value change
//                             },
//                             items: filterNames.map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                   style: GoogleFonts.inter(
//                                       textStyle: const TextStyle(fontSize: 16)),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ]),
//                 ),
//                 IconButton(
//                     onPressed: () async {
//                       http.Response res = await http.post(
//                           Uri.parse("$url/post"),
//                           body: jsonEncode({
//                             "user_id": "123",
//                             "type": "search",
//                             "content": searchController.text,
//                             "id": ""
//                           }));
//                       //TODO: implement posts list update
//                     },
//                     icon: Icon(
//                       Icons.search,
//                       color: Theme.of(context).colorScheme.primary,
//                     ))
//               ],
//             ),
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5.0),
//             borderSide: const BorderSide(color: Colors.transparent, width: 0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5.0),
//             borderSide: const BorderSide(color: Colors.transparent, width: 0),
//           ),
//           fillColor: Colors.grey.shade200,
//           filled: true,
//         ),
//       ),
//     ),
//     actions: [
//       TextButton(
//         onPressed: () {
//           postDialog(context);
//         },
//         style: ButtonStyle(
//             backgroundColor: WidgetStateProperty.all(Colors.black),
//             shape: WidgetStateProperty.all(RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10))),
//             fixedSize: WidgetStateProperty.all(const Size(100, 30))),
//         child: Text(
//           "Create +",
//           style: GoogleFonts.inter(
//               color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       const SizedBox(width: 20),
//       InkWell(
//         onTap: () {},
//         child: Image.asset("assets/icons/bell.png", height: 30, width: 30),
//       ),
//       const SizedBox(width: 20),
//       InkWell(
//         onTap: () {},
//         child: Image.asset("assets/icons/message.png", height: 30, width: 30),
//       ),
//       const SizedBox(width: 20),
//       InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile(email: "123")));
//           // Navigator.pushNamed(context, '/profile');
//         },
//         child: Row(
//           children: [
//             CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 18,
//                 backgroundImage:
//                     NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)),
//             const SizedBox(
//               height: 30,
//               width: 30,
//               child: Icon(
//                 Icons.arrow_drop_down_outlined,
//                 color: Colors.grey,
//               ),
//             )
//           ],
//         ),
//       ),
//     ],
//   );
// }
