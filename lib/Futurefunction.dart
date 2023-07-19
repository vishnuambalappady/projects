import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Fut extends StatefulWidget {
  const Fut({Key? key}) : super(key: key);

  @override
  State<Fut> createState() => _FutState();
}

class _FutState extends State<Fut> {
  Future<dynamic> getdata() async {
    Response response = await get(Uri.parse('https://dummyjson.com/users'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data["users"].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.pink,
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(snapshot.data["users"][index]["firstName"]),
                              Text(snapshot.data["users"][index]["age"]
                                  .toString()),
                              Text(snapshot.data["users"][index]["email"]),
                              Text(snapshot.data["users"][index]["phone"])
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Text('ee');
              }
            }),
      ),
    );
  }
}
