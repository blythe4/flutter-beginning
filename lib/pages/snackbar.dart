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
      body: Builder(
        builder: (BuildContext ctx) {
          return Center(
            child: TextButton(
              child: (Text("Show me")),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () => {
                ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                  content: Text("Hello"),
                ))
              },
            ),
          );
        },
      ),
    );
  }
}
