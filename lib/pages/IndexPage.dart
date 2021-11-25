import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<IndexPage> {
  List employee_list = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  //fetch data using  http
  void fetchData() async {
    var url = Uri.parse(
        "https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          employee_list = json.decode(response.body)['clients'];
          isLoading = false;
        });
      } else {
        employee_list = [];
        isLoading = false;
      }
    } catch (err) {
      print(err);
    }
  }

  //display of every employee in list
  Widget getList(individual_employee) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${individual_employee['name']}',
              style: TextStyle(
                fontSize: 20,
                color: CupertinoColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              '${individual_employee['company']}',
              style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.w600),
            )
          ],
        ));
  }

  Widget getBody() {
    if (employee_list.length < 0 || isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: employee_list.length,
        itemBuilder: (BuildContext context, int index) {
          return getList(employee_list[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listexample"),
          backgroundColor: Color(0xff645dd7),
        ),
        body: getBody());
  }
}
