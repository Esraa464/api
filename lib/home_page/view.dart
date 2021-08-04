import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/home_page/controller.dart';
import 'package:untitled/home_page/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> comningData = [];
  bool isLoading = true;

  void aggg() async {
    Controller cont = Controller();
    comningData = await cont.fetchData();
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
        itemCount: comningData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(comningData[index].image),
              Text(comningData[index].name),
            ],
          );
        },
      ),
    );
  }
}
