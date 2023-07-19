import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Hhh extends StatefulWidget {
  const Hhh({Key? key}) : super(key: key);

  @override
  State<Hhh> createState() => _HhhState();
}

class _HhhState extends State<Hhh> {
  sentdata()async{
    var body ={
     "id":a.text
    };
   Response response = await post(Uri.parse("http://192.168.68.104:8080/userid"),
       body:jsonEncode(body) );
   if (response.statusCode==200){
     var c= jsonDecode(response.body);
     print(c);

     if(c["message"]=="falid"){

     }else{
       return c;
     }


   }

  }
  TextEditingController a =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: TextField(
               controller: a,
               decoration: InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
                )
               ),
             ),
           ),
           ElevatedButton(onPressed: (){
             setState(() {

             });
           }, child:Text('Oops') ),
           Expanded(
             child: FutureBuilder(
               future: sentdata(),
               builder: (context,AsyncSnapshot snapshot) {
                 if(snapshot.connectionState== ConnectionState.waiting){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
                 if(snapshot.hasData){
                 return ListView.builder(
                   itemCount: snapshot.data['data'].length,
                   itemBuilder: (context,index) {
                     return ListTile(
                       leading: Container(
                         height: 80,
                         width: 80,
                         decoration: BoxDecoration(
                           color: Colors.deepOrange,
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
               } else {
                   return Center(child: Text('Error 404'));
                 }
    }
             ),
           )
         ],
       ),
     ),
    );
  }
}
