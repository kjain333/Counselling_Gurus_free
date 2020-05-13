
import 'package:flutter/material.dart';

//void main() {
//  runApp(Home());
//}
//
//
//class Home extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Dynamic Card List',
//      theme: ThemeData(
//        primarySwatch: Colors.teal,
//      ),
//      home: MyHomePage(),
//    );
//  }
//}


class ChatBoxPage extends StatefulWidget {
  @override
  _ChatBoxPageState createState() => _ChatBoxPageState();
}

class _ChatBoxPageState extends State<ChatBoxPage> {

  var _listSection = List<Widget>();
  BuildContext mContext;
  String userName = '';
  String quesTitle = '';
  String ques = 'user will display full ques here';

  @override
  void initState() {
    super.initState();
    // Here initialize the list in case it is required
    _listSection.add(
      listSectionMethod("Username", "One line Ques Title", "ques and answer"),
    );
    _listSection.add(
      listSectionMethod("Naman Agarwal", "Date of JEE counselling", ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      body: listSection(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _asyncInputDialog(context);
          });
        },
        icon: Icon(Icons.queue),
        label: Text("Add your Ques"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
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

  Future<String> _asyncInputDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ques Box'),
          content: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Your Name'),
                onChanged: (value) {
                  userName = value;
                },
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Ques title'),
                onChanged: (value) {
                  quesTitle = value;
                },
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Enter your ques'),
                onChanged: (value) {
                  ques = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                setState(() {
                  // Here we add a new item to the list
                  _listSection.add(
                    listSectionMethod(userName , quesTitle, ques),
                  );
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  Card listSectionMethod(String title, String subtitle, String ques) {
    return Card(
      child: GestureDetector(
        onTap: () {
          _ackAlert(mContext);
        } ,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.question_answer),

        ),
      ),
    );
  }

  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Full Ques'),
          content: Text(ques),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}


