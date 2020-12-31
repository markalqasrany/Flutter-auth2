import 'package:flutter/material.dart';
import 'package:signup/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'HomePage', style: TextStyle(color: Colors.white, fontSize: 19.5,),
        ),
        backgroundColor: Colors.black
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Menu', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_back, color: Colors.black, size: 35.0,),
                onTap: () {},
              ),
              ListTile(
                title: Text('Home Page', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
                trailing: Icon(Icons.home, color: Colors.black, size: 35.0,),
                onTap: () {},
              ),
              ListTile(
                title: Text('Profile', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
                trailing: Icon(Icons.account_circle, color: Colors.black, size: 35.0,),
                onTap: () {},
              ),   
              ListTile(
                title: Text('Messages', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
                trailing: Icon(Icons.chat, color: Colors.black, size: 35.0,),
              ),
              ListTile(
                title: Text('Friends', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
                trailing: Icon(Icons.supervisor_account, color: Colors.black, size: 35.0,),
              ),  
              ListTile(
                title: Text('Apps', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
                trailing: Icon(Icons.apps, color: Colors.black, size: 35.0,),
              ),   
              ListTile(
                title: Text('Log out', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
                trailing: Icon(Icons.mood_bad, color: Colors.black, size: 35.0,),
                onTap: () {
                  AuthService().signOut();
                },
              ),    
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('HomePage', style: TextStyle(fontSize: 25.0, color: Colors.black,),
              ),
            ),
          ],
        ),
    );
  }
}