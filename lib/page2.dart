import 'package:flutter/material.dart';

class hi extends StatefulWidget {

  String? aa;
   hi({Key? key,required this.aa}) : super(key: key);

  @override
  State<hi> createState() => _hiState();
}

class _hiState extends State<hi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
           widget.aa.toString()
          ),
        )
      ),
    );
  }
}
