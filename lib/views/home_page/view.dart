import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/views/home_page/cubits/controller.dart';
import 'package:untitled/views/home_page/models/model.dart';
import 'package:untitled/views/login_screen/controller.dart';
import 'package:untitled/views/login_screen/view.dart';
import 'package:untitled/widgets/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> comingData = [];
  bool isLoading = true;
  final controller = LoginController();

  void getData() async {
    // Controller cont = Controller();
    comingData = await Controller().fetchData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              child: Icon(
                Icons.logout,
              ),
              onTap: () async {
                controller.logout();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => LoginView()));
              },
            )
          ],
        ),
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
