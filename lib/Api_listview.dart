import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Bt extends StatefulWidget {
  const Bt({Key? key}) : super(key: key);

  @override
  State<Bt> createState() => _BtState();
}

class _BtState extends State<Bt> {
  var body;
  void getdata()async{
    Response response= await get(Uri.parse('https://reqres.in/api/users?page=2'));
    if(response.statusCode==200) {
      setState(() {
        body =jsonDecode(response.body);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: (){
                  getdata();
                },
                child: Text('Press'),
              ),
            ),

            body!=null?Expanded(
              child: ListView.builder(
                itemCount: body["data"].length,
                itemBuilder: (context,index) {
                  return Container(
                   child: ListTile(
                     leading: Container(
                       height: 70,
                       width: 70,
                       decoration: BoxDecoration(
                         color: Colors.pink,
                         shape: BoxShape.circle,
                         image:DecorationImage(
                           image:  NetworkImage(body['data'][index]['avatar'])
                         )
                       ),
                     ),
                     title: Text(body['data'][index]['first_name']),
                     subtitle: Text(body['data'][index]['email']),
                   ),
                  );
                }
              ),
            ):SizedBox()
          ],
        ),
      ),
    );
  }
}
