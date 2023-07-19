import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Pixel extends StatefulWidget {
  const Pixel({Key? key}) : super(key: key);

  @override
  State<Pixel> createState() => _PixelState();
}

class _PixelState extends State<Pixel> {
  var body;
  void getdata()async{
  Response response = await get(Uri.parse('https://reqres.in/api/users/2'));
   if (response.statusCode==200)
   
    setState(() {
      body=jsonDecode(response.body);
    });
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
                child: Text('Select'),
              ),
            ),
            body!=null?Container(
              child: ListTile(
                leading: Container(
                  height: 70,
                 width: 70,
                 decoration: (BoxDecoration(
                   color: Colors.cyanAccent,
                   shape: BoxShape.circle,
                   image: DecorationImage(image:NetworkImage(body['data']['avatar']))
                 )),
                ),
                title: Text('Galaxy'),
                subtitle: Text('california'),
              ),
            ):SizedBox()
          ],
        ),
      ),
    );
  }
}
