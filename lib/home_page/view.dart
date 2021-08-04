import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/home_page/controller.dart';
import 'package:untitled/home_page/model.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<Article> comingData = [];
  // bool isLoading = true;

  void Data() async {
    Controller cont = Controller();
    comingData = await cont.fetchData();
    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  void initState() {
    super.initState();
    Data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: comingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(comingData[index].image),
              Text(comingData[index].name),
            ],
          );
        },
      ),
    );
  }
}
