import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Get2.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {

  sentdata()async{
    var body ={
      'email':user.text,
      'password':email.text
    };
    Response response = await post(Uri.parse("http://192.168.29.180:8080/logindata"),
    body: jsonEncode(body));


    print(response.statusCode);
    if (response.statusCode ==200){
      var e=jsonDecode(response.body);
      print(e);
      if (e['message']=='success'){

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Hhh(),));
      }
    }
  }
  TextEditingController user=TextEditingController();
  TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: user,
           decoration: InputDecoration(
             border: OutlineInputBorder(

             ),
             hintText: 'enter your username'
           ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(

                ),
                hintText: 'enter your email'
              ),
            ),
            ElevatedButton(onPressed: (){
              sentdata();
            }, child: Text('Press'))
          ],
        ),
      ),
    );
  }
}
