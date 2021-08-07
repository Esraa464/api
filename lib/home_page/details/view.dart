// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/home_page/controller.dart';
// import 'package:untitled/home_page/model.dart';
//
// class Details extends StatefulWidget {
//   @override
//   _DetailsState createState() => _DetailsState();
// }
//
// class _DetailsState extends State<Details> {
//   List<Article> details = [];
//   bool isLoading = true;
//
//   void data() async {
//     Controller con = Controller();
//     details = await con.fetchData();
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     Details();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: details.length,
//                 itemBuilder: (context, index) => Column(
//                       children: [Text(details[index].birthDAy)],
//                     )));
//   }
// }
