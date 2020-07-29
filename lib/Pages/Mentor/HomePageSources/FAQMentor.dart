//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/HomePageSources/FAQAnswerMentor.dart';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'FAQAnswerMentor.dart';
final questions = ['Q1. Which degree is superior, B.E. or B. Tech. in terms of job scope and future?',
  'Q2. If two colleges hold equal status, then what should I prefer, B.E. or B. Tech?',
  'Q3. What is the difference between science and engineering?',
  'Q4. Is it possible to pursue regular B.Tech and diploma course at one time?',
  'Q5. Can JoSAA prepare / announce JEE Main 2020 ranks?'];
final answer = ['Ans. Both degrees have equal recognition with equal scope and future. More precisely, it’s your college and branch that matters.',
  'Ans. If a student is interested in research-oriented work and wants to pursue higher studies then B.E. may be preferred over B. Tech. However, in the present situation analysis shows that course content is almost the same but the approach may be different.',
  'Ans. Science is knowledge based on observed facts and tested truths arranged in an orderly system that can be validated and communicated to other people. Engineering is the creative application of scientific principles used to plan, build, direct, guide, manage, or work on systems to maintain and improve our daily lives.',
  'Ans. Two regular courses can\'t be pursued together. One course should be regular and the other should be distance or short-term certificate course.',
  'Ans. No. JEE Main 2020 ranks are provided by the JEE Apex Board. JoSAA 2020 uses these ranks as such without any further change.'];
final expanded=[false,false,false,false,false];
class FAQMentor extends StatefulWidget{
  static _FAQMentor of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_FAQMentor>());
  @override
  State<StatefulWidget> createState() {
    return _FAQMentor();
  }

}
class _FAQMentor extends State<FAQMentor>{
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
                      child: Text('Here you will find the Frequently asked Questions. Feel free to contact us if you have any another question not mentioned here.',style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w100),),
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
                title: Text(answer[index],style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
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
