import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:networkapp/model/model.dart';
import 'package:networkapp/services/api.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee>? list;
  bool isLoading = true;

  get() async {
    Network.GET("/api/v1/employees", {}).then((javob) {
      setState(() {
        list = javob.data;
        isLoading = false;
      });
    });
  }

  //  post() async {
  //   Network.Post(api:"/posts", params: root.toJson()).then((javob) {
  //     setState(() {
  //       data2 = javob;
  //       isLoading = false;
  //     });
  //   });
  // }

  //  put() async {
  //   Network.PUT("/posts/"+root.id.toString(), root.toJson()).then((javob) {
  //     setState(() {
  //       data3 = javob;
  //       isLoading = false;
  //     });
  //   });
  // }
  // delete() async {
  //   Network.DELETE("/posts/"+root.id.toString(), {}).then((javob) {
  //     setState(() {
  //       data4 = javob;
  //       isLoading = false;
  //     });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: list!.length,
              itemBuilder: ((context, index) => item(list![index]))),
    );
  }
}

Widget item(Employee ishchi) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${ishchi.employeename!}(${ishchi.employeeage!})",
          style: const TextStyle(fontSize: 19),
        ),
        const SizedBox(
          height: 5,
        ),
        Text("${ishchi.employeesalary!}\$"),
      ],
    ),
  );
}
