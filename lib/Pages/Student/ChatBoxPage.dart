import 'package:flutter/material.dart';
import 'QuesPage.dart';
import 'QuesAnsPage.dart';

//void main() {
//  runApp(MyApp());
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Image Picker Demo',
//      home: ChatBoxPage(),
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
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Counselling Gurus"),
      ),
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


  Card listSectionMethod(String title, String subtitle, String ques) {
    return Card(
      child: GestureDetector(
        onTap: () {
          //_ackAlert(mContext);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuesAnsPage()),
          );
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
}


