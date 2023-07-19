import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Asw extends StatefulWidget {
  const Asw({Key? key}) : super(key: key);

  @override
  State<Asw> createState() => _AswState();
}

class _AswState extends State<Asw> {
  var body;
  void getdata()async{
    Response response= await get(Uri.parse('https://dummyjson.com/products'));
    if(response.statusCode==200){
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
                child: Text('Show me'),
              ),
            ),
            body!=null?Expanded(
              child: ListView.builder(
                itemCount: body['products'].length,
                itemBuilder: (context,index) {
                  return Container(
                    child: ListTile(
                      leading: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(body['products'][index]["thumbnail"])
                          )
                        ),
                      ),
                      title: Text(body["products"][index]["title"]),
                      subtitle: Text(body[ "products"][index][ "description"]),
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
