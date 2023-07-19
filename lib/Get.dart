import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Gg extends StatefulWidget {
  const Gg({Key? key}) : super(key: key);

  @override
  State<Gg> createState() => _GgState();
}

class _GgState extends State<Gg> {
  sentdata()async{
    var body= {
      "id":"2"
    };
    Response response= await post(Uri.parse("http://192.168.68.104:8080/userid"),
        body: jsonEncode(body));
    if (response.statusCode==200){
     var b=jsonDecode(response.body);
     print(b);
     return b;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SafeArea(
       child: FutureBuilder(
         future: sentdata(),
         builder: (context,AsyncSnapshot snapshot) {
           if(snapshot.connectionState== ConnectionState.waiting){
             return Center(
               child: CircularProgressIndicator(),
             );
           }
           if (snapshot.hasData) {
           return ListView.builder(
             itemCount: snapshot.data['data'].length,
             itemBuilder: (context,index) {
               return ListTile(
                 leading: Container(
                   height: 80,
                   width: 80,
                   decoration: BoxDecoration(
                     color: Colors.cyanAccent,
                     shape: BoxShape.circle,
                     image: DecorationImage(
                       image: NetworkImage(snapshot.data['data'][index]['avatar'])
                     )
                   ),
                 ),
                 title: Text(snapshot.data['data'][index]['first_name']),
                 subtitle: Text(snapshot.data['data'][index]['email']),
               );
             }
           );

         }else{
             return Center(child: Text('no data'));
           }
         }
       ),
       ),

    );
  }
}
