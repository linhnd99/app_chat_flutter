import 'package:cloud_firestore/cloud_firestore.dart';

class MessageMethods {
  Firestore _firestore = Firestore.instance;
  
  getMessages() async {
    CollectionReference messages = await _firestore.collection('MESSAGES');
    messages.snapshots(includeMetadataChanges: true);
    List<String> listMessage = new List<String>();
    QuerySnapshot querySnapshot = await messages.getDocuments();
    querySnapshot.documents.forEach((element) {
      listMessage.add(element.data['content']);
    });

    return listMessage;
  }
}