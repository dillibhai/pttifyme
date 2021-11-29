import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pttifyme/constraints/constants.dart';
import 'dart:ui';
import 'package:pttifyme/controller/homecontroller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorUtils.primarycolor,
          // centerTitle: true,
          title: Text(
            'PTTify Me',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: ColorUtils.black,
            ),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/hamburger.png',
                height: 20,
                width: 20,
              )),
          actions: [tabbtns()],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 7),
                child: const Text(
                  "Recent PTT",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, bottom: 10),
                child: _imgdata(),
                height: 87,
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Recent Chat",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: double.infinity,
                  child: _msgdata(),
                ),
              )
            ],
          ),
        ));
  }

  Widget tabbtns() {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/link.png', height: 20, width: 20)),
        IconButton(
            onPressed: () {},
            icon:
                Image.asset('assets/images/search.png', height: 24, width: 24)),
      ],
    );
  }

  Widget _msgdata() {
    return controller.obx(
      (data) => ListView.builder(
          itemCount: data!.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(data[index]['picture']['large']),
                  ),
                  title: Text(
                    data[index]['name']['title'] +
                        " " +
                        data[index]['name']['first'] +
                        " " +
                        data[index]['name']['last'],
                  ),
                  subtitle: Text(
                    data[index]['email'],
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 50),
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            );
          }),
      onError: (error) => Center(
        child: Text(error.toString()),
      ),
    );
  }

  Widget _imgdata() {
    return controller.obx(
      (data) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data!.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(data[index]['picture']['large']),
                    ),
                    Text(data[index]['name']['first'])
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            );
          }),
      onError: (error) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
//bhsg hjgshj sjhghs