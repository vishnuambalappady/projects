import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'newModels.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  Future<Products?>getdata()async{
    Response response = await get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode==200){
      var bdy = jsonDecode(response.body);
      final products = productsFromJson(response.body);
      return products;
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getdata(),
          builder: (context,Snapshot) {
            if (Snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if (Snapshot.hasData){
              return ListView.builder(
                  itemBuilder: (context,index) {
                    return Text(Snapshot.data!.products[index].title);
                  }
              );
            }else{
              return Center(child: Text(' No data'));
            }

          }
        ),
      ),
    );
  }
}
