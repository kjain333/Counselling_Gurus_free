//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/HomePageSources/FAQAnswer.dart';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FAQAnswer.dart';
final questions = ['What is Question 1 ?','What is Question 2?','What is Question 3?','What is Question 4?','What is Question 5?'];
final answer = 'This is the the detailed answer to the question. This can be multiline and very long as well';
final expanded=[false,false,false,false,false];
class FAQ extends StatefulWidget{
  static _FAQ of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_FAQ>());
  @override
  State<StatefulWidget> createState() {
    return _FAQ();
  }
}
class _FAQ extends State<FAQ>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text('FAQ',style: TextStyle(fontFamily: 'icons',fontWeight: FontWeight.w900,fontSize: 30,color: Colors.white),),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Here you will find the Frequently asked Questions. Feel free to contact us if you have any another question not mentioned here.',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w100),),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return QuestionCard(index,context);
            }, childCount: questions.length),
          )
        ],
      )
    );
  }


Widget QuestionCard(int index,BuildContext context){
  return Padding(
    padding: EdgeInsets.all(20),
    child: Material(
      elevation: 10,
      child: ExpansionPanelList(
        expansionCallback: (int ind,bool status){
          setState(() {
            if(expanded[index]==true)
              expanded[index]=false;
            else
            {
              for(int i=0;i<questions.length;i++)
                expanded[i]=false;
              expanded[index]=true;
            }
          });
        },
        children: [
          new ExpansionPanel(
              isExpanded: expanded[index],
              headerBuilder: (BuildContext context,bool isExpanded)=>new ListTile(
                contentPadding: EdgeInsets.all(10),
               // trailing: Icon(Icons.arrow_forward),
                title: Text(questions[index],style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                onTap: (){
                  setState(() {
                    if(expanded[index]==true)
                      expanded[index]=false;
                    else
                      {
                        for(int i=0;i<questions.length;i++)
                          expanded[i]=false;
                        expanded[index]=true;
                      }

                  });
                },
              ),
              body: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(answer,style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
              )
          )
        ],
      )/* ListTile(
        trailing: Icon(Icons.arrow_forward),
        title: Text(questions[index],style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
        onTap: (){
          FAQ.of(context).create();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQAnswer(questions[index],answer)));
        },
      ),*/
    ),
  );
}

}
