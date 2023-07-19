import 'package:api_integration/page2.dart';
import 'package:flutter/material.dart';

class Pp extends StatefulWidget {
  const Pp({Key? key}) : super(key: key);

  @override
  State<Pp> createState() => _PpState();
}

class _PpState extends State<Pp> {
  TextEditingController b=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: b,
            ),
            ElevatedButton(onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (context) => hi(aa: b.text),));

            }, child: Text('Ok'))
          ],
        ),
      ),
    );
  }
}
