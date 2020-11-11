import 'package:app_chat_flutter/Model/AuthMethods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    theme: ThemeData(
      primaryColor: Colors.indigo
    ),
  ));
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController txtEmail, txtPassword;

  double height=250;
  String notice=null;

  @override
  void initState() {
    txtEmail = new TextEditingController();
    txtPassword = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent, Colors.deepPurpleAccent]
            )
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.blueAccent, Colors.deepPurpleAccent]
          )
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(left:30, right:30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(40)
            ),
            padding: EdgeInsets.only(left:40, right: 40,top: 20),
            height: height,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  controller: txtEmail,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  controller: txtPassword,
                ),
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(top:30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.blueAccent, Colors.deepPurpleAccent]
                          )
                      ),
                      height: 50,
                      width: 50,
                      child: Icon(Icons.arrow_forward_ios,color: Colors.white,)
                  ),
                  onTap: LoginWithEmailAndPassword,
                ),
                height==300?Container(
                  margin: EdgeInsets.only(top:30),
                  child: SpinKitDualRing(
                    color: Colors.indigo.withAlpha(150),
                    size: 30.0,
                  ),
                ):Container(),
                height==280?Container(
                  margin: EdgeInsets.only(top:20),
                  child: Text(notice, style: TextStyle(color: Colors.red),),
                ):Container(),
              ],
            ),
          ),
        ),
      )
    );
  }

  void LoginWithEmailAndPassword() async{
    print(txtEmail.text + ' is loging in...');
    setState(() {
      height=300;
    });
    AuthMethods auth = new AuthMethods();
    var res = await auth.signInWithEmailAndPassword(txtEmail.text, txtPassword.text);
    if (res == null) {
      setState(() {
        notice="Login failed";
        height=280;
      });
    }
    else {
      print('login success');
      setState(() {
        notice="Login success";
        height=280;
      });
      // todo
      //Navigator.push(context, MaterialPageRoute(builder: (context)=> .. ));
    }
  }
}