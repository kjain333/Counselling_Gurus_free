import 'package:flutter/material.dart';
import 'QuesPage.dart';
import 'QuesAnsPage.dart';


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
  Color _iconColor = Colors.yellow;

  @override
  void initState() {
    super.initState();
    // Here initialize the list in case it is required
    _listSection.add(
      listSectionMethod("One line Ques Title", "Username", "ques and answer"),
    );
    _listSection.add(
      listSectionMethod("Date of JEE counselling", "Naman Agarwal", ""),
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
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.question_answer),
          onPressed: (){
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
          onTap: (){
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
            onPressed: (){
            },
          ),
        ),
      ),
    );
  }
}


