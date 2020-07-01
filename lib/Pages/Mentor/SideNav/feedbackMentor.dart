

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final elevation = [0,0,0,0,0];
final color = [Colors.grey,Colors.white];
final colorindex = [0,0,0,0,0];
final icons = [Icons.sentiment_very_satisfied,Icons.sentiment_satisfied,Icons.sentiment_neutral,Icons.sentiment_dissatisfied,Icons.sentiment_very_dissatisfied];
final text = ['It was GREAT','It was FINE','It did the job','It was DISAPPOINTING','It was FRUSTRATING'];
final text2 = ['GREAT','SATISFACTORY','OK','DISAPPOINTING','FRUSTRATING'];
class FeedbackPage extends StatefulWidget{
  @override
  _FeedbackPage createState() {
    return _FeedbackPage();
  }

}
class _FeedbackPage extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child:Center(child: Text('Feedback',style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('How do you feel about the support you received from us?',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white),),

                ),
              )
            ),
            buildFeedbackTile(0),
            SizedBox(
              height: 30,
            ),
            buildFeedbackTile(1),
            SizedBox(
              height: 30,
            ),
            buildFeedbackTile(2),
            SizedBox(
              height: 30,
            ),
            buildFeedbackTile(3),
            SizedBox(
              height: 30,
            ),
            buildFeedbackTile(4),
            SizedBox(
              height: 80,
            ),
            RaisedButton(
              onPressed: (){
                int flag=0;
                for(int i=0;i<5;i++)
                  {
                    if(elevation[i]==30)
                      {
                        flag=1;
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>feedback(i)));
                      }
                  }
                if(flag==0)
                  {
                    showAlertDialog(context);
                  }
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('CONTINUE',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,color: Colors.blueGrey,fontSize: 20),),
            )
          ],
        ),
      )
     /* body: Padding(
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
              buildForm(),
              SizedBox(
                height: 5.0,
              ),
              buildMobileField(),
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
      ),*/
    );
  }
  showAlertDialog(context){
    Widget okButton = FlatButton(
      child: Text('OK'),
      onPressed: (){
        Navigator.pop(context);
      },
    );
    AlertDialog alert= AlertDialog(
      content: Text('Please select one of the above to continue your feedback'),
      actions: <Widget>[
        okButton,
      ],
    );
    showDialog(context: context,
      builder: (context){
        return alert;
      },
    );
  }
  buildFeedbackTile(index){
    return GestureDetector(
        onTap: (){
          setState(() {
            for(int i=0;i<5;i++)
              {
                elevation[i]=0;
                colorindex[i]=0;
              }
            elevation[index]=30;
            colorindex[index]=1;
          });
        },
        child: Material(
          elevation: elevation[index].toDouble(),
          color: Colors.blueGrey,
          child: Container(
            height: 50,
            width: 400,
            child: ListTile(
              leading: Icon(Icons.arrow_right,color: Colors.lightBlueAccent,),
              title: Text(text[index],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 20,color: color[colorindex[index]]),),
              trailing: Icon(icons[index],color: color[colorindex[index]],),
            ),
          ),
        )
    );
  }
  buildMobileField() {
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
}

final issues = [0,0,0,0,0];
class feedback extends StatefulWidget{
  feedback(this.index);
  int index;

  @override
  _feedback createState() {
    return _feedback(index);
  }


}
class _feedback extends State<feedback>{
  _feedback(this.index);
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Stack(

                  children: <Widget>[
                    Positioned(
                      left: MediaQuery.of(context).size.width/2-50,
                      child: IconButton(
                        icon: Icon(icons[index],color: Colors.white,size: 100,),
                        onPressed: (){
                          return null;
                        },
                      ),
                    )
                  ],
                )
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Text(text2[index],style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Text('Help us know where we can improve',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 18,color: Colors.white),),
              ),
            ),
            checkitemwidget("Login Issue",0),
            checkitemwidget("Mentor Allotment Issue",1),
            checkitemwidget("Profile-Related Issues",2),
            checkitemwidget("Other Issues",3),
            checkitemwidget("Suggestions",4),
            SizedBox(
              height: 10,
            ),
            buildForm(),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: (){
                return null;
              },
              color: Colors.white,
              child: Text('SUBMIT',style: GoogleFonts.aBeeZee(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.w300),),
            )
          ],
        ),
      )
    );
  }
  checkitemwidget(String IssueType,int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          for(int i=0;i<5;i++)
            {
              issues[i]=0;
            }
          issues[index]=1;
        });
      },
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.radio_button_unchecked,
                color: color[issues[index]],
              ),
              onPressed: () {
                  setState(() {
                    for(int i=0;i<5;i++)
                    {
                      issues[i]=0;
                    }
                    issues[index]=1;
                  });
              }),
          Text(
            IssueType,
            style: GoogleFonts.aBeeZee(color: color[issues[index]], fontWeight: FontWeight.w300,fontSize: 15),
          )
        ],
      ),
    );
  }
  buildForm() {
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: TextField(
          maxLines: 5,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            hintText: 'Please describe your problem in detail over here.\n\n\n\n',
            hintStyle: TextStyle(color: Colors.grey),
          )
        ),
      ),
    );
  }
}