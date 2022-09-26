import 'package:flutter/material.dart';

class CharacterCard extends StatefulWidget {
  const CharacterCard({Key? key}) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('SNORLAX'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/snorlax.png'),
                radius: 60,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30,
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'SNORLAX',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'NO',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '143',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(width: 10),
                Text(
                  'immunity',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(width: 10),
                Text('thick-fat')
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(width: 10),
                Text('gluttony')
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: AssetImage('assets/images/snorlax_home.png'),
                radius: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
