import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Init extends StatefulWidget {
  const Init({Key? key}) : super(key: key);

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
  var data;

  getdata()async{
  Response response= await get(Uri.parse('https://dummyjson.com/todos'));
   if(response.statusCode==200){
     setState(() {
       data =jsonDecode(response.body);
     });
   }


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: data!=null? ListView.builder(
          itemCount: data["todos"].length,
          itemBuilder: (context,index) {
            return Container(
              child: ListTile(
                leading: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    // color: Colors.cyanAccent
                  ),
                ),
                title: Text(data["todos"][index]["todo"]),
              ),
            );
          }
        ):SizedBox()
      ),
    );
  }
}
