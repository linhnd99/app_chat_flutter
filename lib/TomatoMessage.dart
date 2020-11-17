import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/MessageMethods.dart';

class TomatoMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TomatoMessageState();
}

class TomatoMessageState extends State<TomatoMessage>{

  TextEditingController txtMessage;
  List<String> listMessage;
  bool isMessaging;

  @override
  void initState() {
    listMessage  = new List<String>();
    txtMessage  = new TextEditingController();
    isMessaging = false;

    hihi();

  }

  hihi() async {
    MessageMethods messageMethods = new MessageMethods();
    listMessage = await messageMethods.getMessages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference messages = Firestore.instance.collection('MESSAGES');
    messages.snapshots(includeMetadataChanges: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
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
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height-140,
            child: StreamBuilder<QuerySnapshot>(
              stream: messages.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return new ListView(
                  reverse: true,
                  children: snapshot.data.documents.map((DocumentSnapshot document) {
                    return new ListTile(
                      subtitle: new Text(document.data['content']),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            child: Row(
              children: [
                Container(
                  child: TextField(
                    enabled: !isMessaging,
                    controller: txtMessage,
                    style: TextStyle(
                      color: isMessaging?Colors.grey:Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type your message...'
                    ),
                  ),
                  width: MediaQuery.of(context).size.width-50,
                ),
                GestureDetector(
                  child: Container(
                    width: 30,
                    child: Icon(Icons.send,color: Colors.indigo,),
                  ),
                  onTap: (){
                    setState(() {
                      isMessaging = true;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future sendMessage(String text) async {
    CollectionReference messages = Firestore.instance.collection('MESSAGES');
    messages.snapshots(includeMetadataChanges: true);

    messages.add();
  }
}