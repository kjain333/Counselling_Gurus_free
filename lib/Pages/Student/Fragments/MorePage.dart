

import 'package:counselling_gurus/Pages/Student/HomePageSources/Disclaimer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiredash/wiredash.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}
void showFeedback(context) {
  Wiredash.of(context).show();
}
class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: const SizedBox(
                height: 160,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              height: 1,
            ),
            Container(
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                title: Center(
                  child: Text("Share App", style: GoogleFonts.aBeeZee()),
                ),
                leading: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  return null;
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),

              ),
            ),
            Container(
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                title: Center(
                  child: Text("Feedback", style: GoogleFonts.aBeeZee()),
                ),
                leading: Icon(
                  Icons.add_comment,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  showFeedback(context);
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),

              ),
            ),
            Container(
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                title: Center(
                  child: Text("Rate Us", style: GoogleFonts.aBeeZee()),
                ),
                leading: Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  return null;
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),

              ),
            ),
            Container(
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                title: Center(
                  child: Text("Disclaimer", style: GoogleFonts.aBeeZee()),
                ),
                leading: Icon(
                  Icons.notifications_active,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Disclaimer()));
                },
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
