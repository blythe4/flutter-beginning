import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessageTest extends StatefulWidget {
  const ToastMessageTest({Key? key}) : super(key: key);

  @override
  State<ToastMessageTest> createState() => _ToastMessageTestState();
}

class _ToastMessageTestState extends State<ToastMessageTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast message'),
        centerTitle: true,
        elevation: 0,
      ),
      body: MyToastMessage(),
    );
  }
}

class MyToastMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text("Toast"),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () => {flutterToast()},
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
    msg: 'Flutter ttt',
    gravity: ToastGravity.BOTTOM_LEFT,
    backgroundColor: Colors.redAccent,
    fontSize: 30,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
