import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
var string = ['JOSAA','WBJEE','MHCET','ABCD'];
class Counselling extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade200,Colors.blue.shade400,Colors.blue.shade700]
              )
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                )
              ),
              SliverList(
                delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Mylist(index,context);
                }, childCount: string.length),
              )
            ],
          )
        ],
      ),
    );
  }

}
Mylist(int index,BuildContext context){
  return Padding(
    padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
    child: Material(
      elevation: 30,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(string[index],style: GoogleFonts.aBeeZee(fontSize: 30,fontWeight: FontWeight.w900,color: Color.fromARGB(1000,0,182,217)),),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text("This is where we will show a few lines of description about each category.Let us take an example where it is 2-3 lines.",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300,color: Color.fromARGB(1000,0,182,217)),),
            ),
            RaisedButton(
              onPressed: (){
                return null;
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color.fromARGB(1000, 0, 182, 217),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Know More",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w200,color: Colors.white),),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ),
  );
}