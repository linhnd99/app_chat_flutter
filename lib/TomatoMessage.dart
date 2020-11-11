import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  }

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
                reverse: true,
                itemCount: listMessage.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(listMessage[index]),
                  );
                }
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
}