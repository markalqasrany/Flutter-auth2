import 'package:flutter/material.dart';
import 'package:signup/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email, password;
  final formKey = new GlobalKey<FormState>();


  // ignore: non_constant_identifier_names
  CheckFields() {
    final form = formKey.currentState;
    if(form.validate()) {
      return true;
    }
    else {
      return false;
    }

  }
  
  String validateEmail(String value) {
    Pattern pattern =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
    return 'Enter vaild Email';
    else
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Welcome', style: TextStyle(letterSpacing: 1.0),
          ),
       ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              Image(
                  height: 150.0,
                  width: 270.0,
                  image: AssetImage('assets/openworld.png'),
                ),
                Text( //Log in text style
                  'Log in to OpenWorld', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.normal, color: Colors.white),
                ),
                SizedBox(
                  height: 1.0,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Form(
                  child: Card(  //EmailBox
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0,),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w500,),
                    decoration: InputDecoration(
                      icon: Icon(Icons.email, color: Colors.black, size: 31.0,),
                      border: InputBorder.none,
                      hintText: 'Email', hintStyle: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold,)),
                      validator: (value) => value.isEmpty ? 'Email is required' : validateEmail(value.trim()),
                      onChanged: (value) {
                      this.email = value;
                    },
                  ),
                ),
                ),
                Form(  //PasswordBox
                    key: formKey,
                    child: Card(
                    color: Colors.white,
                     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0,),
                      child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 19.0,),
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock, color: Colors.black, size: 31.0,),
                        border: InputBorder.none,
                        hintText: 'Password',hintStyle: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold,)),
                        validator: (value) => value.isEmpty ? 'Password is required' : null,
                        onChanged: (value) {
                        this.password = value;
                      },
                    ),
                    ),
                  ),
                RaisedButton(
                  onPressed: () {
                    if(CheckFields()) {
                      AuthService().signIn(email, password);
                    }
                  },
                  child: Text(
                      'Sign In', style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    ),
                Card(
                   child: RaisedButton(
                   color: Colors.black,
                  onPressed: () {},
                  child: Text(
                      "Don't have an account?" '  Sign Up', style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    ),
                  color: Colors.black,
                ),
                SizedBox(
                  height: 100.0,
                  child: Divider(
                  color: Colors.black,
                ),
               ),
             ],
           ),
         ),
       );
      }
    }