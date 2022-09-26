import 'package:flutter/material.dart';

class containerWidgetTest extends StatefulWidget {
  const containerWidgetTest({Key? key}) : super(key: key);

  @override
  State<containerWidgetTest> createState() => _containerWidgetTestState();
}

class _containerWidgetTestState extends State<containerWidgetTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          alignment: Alignment.center,
          child: Text('Hello'),
        ),
      ),
    );
  }
}
