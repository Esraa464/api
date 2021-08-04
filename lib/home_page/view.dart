import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/home_page/controller.dart';
import 'package:untitled/home_page/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Article>ag = [];
  bool isLoading = true;

  void aggg() async {
    Controller cont = Controller();
    ag = await cont.fetchData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    aggg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: ag.length,
        itemBuilder: (context, index) {
          return
            Column(children: [ Image.network(ag[index].image),
              Text(ag[index].name),
            ],);
        },
      ),
    );
  }
}
