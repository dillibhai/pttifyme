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
      body: _msgdata(),
    );
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
          padding: const EdgeInsets.all(8),
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
                  height: 10,
                )
              ],
            );
          }),
      onError: (error) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
