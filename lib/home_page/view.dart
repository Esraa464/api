import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data.dart';
import 'package:untitled/home_page/controller.dart';
import 'package:untitled/home_page/details/view.dart';
import 'package:untitled/home_page/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> comingData = [];
  bool isLoading = true;

  void data() async {
    Controller cont = Controller();
    comingData = await cont.fetchData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: comingData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Data(
                                name: comingData[index].name,
                                birthDAy: comingData[index].birthDAy,
                                nickname: comingData[index].nickname,
                                portrayed: comingData[index].portrayed,
                                status: comingData[index].status,
                              ))),
                  child: Column(
                    children: [
                      Image.network(comingData[index].image),
                      Text(comingData[index].name),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
