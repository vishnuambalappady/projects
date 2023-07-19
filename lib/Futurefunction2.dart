import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Fm extends StatefulWidget {
  const Fm({Key? key}) : super(key: key);

  @override
  State<Fm> createState() => _FmState();
}

class _FmState extends State<Fm> {
  Future<dynamic> getdata()async{
    Response response=await get(Uri.parse('https://dummyjson.com/quotes'));
    if (response.statusCode==200) {
      var body= jsonDecode(response.body);
      return body;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: FutureBuilder(
        future: getdata(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.cyanAccent,
                      height: 100,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Column(
                        children: [
                          Text(snapshot
                              .data["quotes"][index]['id'].toString()),
                          Text(snapshot.data["quotes"][index][ "quote"]),
                          Text(snapshot.data["quotes"][index][ "author"])
                        ],
                      ),
                    ),
                  );
                }
            );
          } else {
            return Center(child: Text('Aaa'));
          }
        }),
      ),
    );
  }
}
