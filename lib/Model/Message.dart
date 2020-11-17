class Message {
  String content;
  String ID;
  String date;
  String userID;

  Message({this.content, this.ID, this.date, this.userID});

  Message.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    ID = json['ID'];
    date = json['date'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['ID'] = this.ID;
    data['date'] = this.date;
    data['userID'] = this.userID;
    return data;
  }
}