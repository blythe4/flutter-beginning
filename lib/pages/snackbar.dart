import 'package:flutter/material.dart';

class SnackBarTest extends StatefulWidget {
  const SnackBarTest({Key? key}) : super(key: key);

  @override
  State<SnackBarTest> createState() => _SnackBarTestState();
}

class _SnackBarTestState extends State<SnackBarTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
        centerTitle: true,
        elevation: 0,
      ),
      body: MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Show me"),
        onPressed: () => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Helloooooow",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.teal,
            duration: Duration(microseconds: 1000),
          ))
        },
      ),
    );
  }
}
