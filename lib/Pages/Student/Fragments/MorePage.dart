import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
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
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                title: Center(
                  child: Text("Edit Profile", style: GoogleFonts.aBeeZee()),
                ),
                leading: Icon(
                  Icons.account_circle,
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
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      top: BorderSide(color: Colors.grey)),

              ),
            ),
            Container(
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                title: Center(
                  child: Text("Change Password", style: GoogleFonts.aBeeZee()),
                ),
                leading: Icon(
                  Icons.lock,
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
                  Navigator.pushReplacementNamed(context, "/FeedbackPage");
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
                  child: Text("Log Out", style: GoogleFonts.aBeeZee()),
                ),
                leading: Icon(
                  Icons.exit_to_app,
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
          ],
        ),
      ),
    );
  }
}
