import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "FeedBack",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {}),
        backgroundColor: Colors.black87,
        centerTitle: true,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: null),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Please Select The Type of the Feedback",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              checkitemwidget("Login Issue"),
              checkitemwidget("Mentor Allotment Issue"),
              checkitemwidget("Profile-Related Issues"),
              checkitemwidget("Other Issues"),
              checkitemwidget("Suggestions"),
              SizedBox(
                height: 5.0,
              ),
              BuildForm(),
              SizedBox(
                height: 5.0,
              ),
              BuildMobileField(),
              SizedBox(
                height: 5.0,
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Expanded(
                      child: FlatButton(
                    color: Colors.grey,
                    onPressed: () {},
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  BuildMobileField() {
    return TextField(
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "+91",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.grey),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            )
          ],
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
        hintText: "Phone Number",
        border: OutlineInputBorder(),
      ),
    );
  }

  BuildForm() {
    return Container(
      height: 120.0,
      child: Stack(
        children: <Widget>[
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
                hintText: "Please Describe your Issue in Detail Here",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.0,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                width: 1.0,
                color: Colors.grey,
              ))),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffe5e5e5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.add, color: Color(0xffa5a5a5))),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Upload ScreenShots (Optional)",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  checkitemwidget(String IssueType) {
    return Row(
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.radio_button_unchecked,
              color: Colors.black87,
            ),
            onPressed: () {}),
        Text(
          IssueType,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
