import 'dart:convert';
import 'package:flutter/material.dart';
import '../Pages/Student/QuesPage.dart';
import '../Pages/Student/QuesAnsPage.dart';
import 'package:http/http.dart' as http;

class ChatBoxPage extends StatefulWidget {
  @override
  _ChatBoxPageState createState() => _ChatBoxPageState();
}

class _ChatBoxPageState extends State<ChatBoxPage> {
  var _listSection = List<Widget>();
  BuildContext mContext;
  String username, questionTitle, question;
  Color _iconColor = Colors.yellow;
  JsonDecoder jsonDecoder = new JsonDecoder();
  Map<String, dynamic> jsonData;
  int length;

//  getQuestions() async {
//    Uri uri = Uri.parse('http://192.168.43.70:3060/getquestion');
//    http.Response response =
//        await http.get(uri, headers: {"Accept": "application/json"});
//    print(response.body);
//    if (response.statusCode == 200) {
//      setState(() {
//        jsonData = jsonDecoder.convert(response.body);
//        length = jsonData['count'];
//        for(int i=0; i<length; i++){
//          _listSection.add(listSectionMethod(jsonData['ques'][i]['username'], jsonData['ques'][i]['questionTitle'], jsonData['ques'][i]['question']),
//          );
//        }
//      });
//    } else {
//      throw Exception('Failed to load data');
//    }
//  }

  @override
  void initState() {
  //  getQuestions();
    super.initState();
    // Here initialize the list in case it is required
    _listSection.add(listSectionMethod("Anubhav", "Best IIT", "Which is the best IIT?"));
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(

      body: listSection(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            //  _asyncInputDialog(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuesPage()),
            );
          });
        },
        icon: Icon(Icons.queue),
        label: Text("Add your Ques"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget listSection() {
    return Container(
      child: ListView(
        children: [
          Column(
            children: this._listSection, // ----> Add this
          ),
        ],
      ),
    );
  }

  Card listSectionMethod(String title, String subtitle, String ques) {
    return Card(
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.question_answer),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuesAnsPage()),
            );
          },
        ),
        isThreeLine: true,
        dense: false,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: GestureDetector(
          onTap: () {
            print("Hello");
            // increase no. of likes
            setState(() {
              print("Hey");
              _iconColor = Colors.red;
            });
          },
          child: IconButton(
            icon: Icon(Icons.thumb_up),
            color: _iconColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
