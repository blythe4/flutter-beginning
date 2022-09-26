import 'package:flutter/material.dart';

class AppBarTest extends StatefulWidget {
  const AppBarTest({Key? key}) : super(key: key);

  @override
  State<AppBarTest> createState() => _AppBarTestState();
}

class _AppBarTestState extends State<AppBarTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () => {print('===== Menu button is clicked!! =====')},
        // ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () =>
                {print('===== Shopping cart button is clicked!! =====')},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {print('===== Search button is clicked!! =====')},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Selina'),
              accountEmail: Text('blythe@abc.kr'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/snorlax.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/snorlax_home.png'),
                  backgroundColor: Colors.white,
                )
              ],
              onDetailsPressed: () =>
                  {print('======= Detail Button is clicked =======')},
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: () => {print('======= Home is clicked =======')},
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Setting'),
              onTap: () => {print('======= Setting is clicked =======')},
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Q&A'),
              onTap: () => {print('======= Q&A is clicked =======')},
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
