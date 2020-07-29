
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Dashboard.dart';
final student = ["Student 1","Student 2","Student 3","Student 4","Student 5"];
class StudentsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text("Students Assigned",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 25),),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,
              ),
            )
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return gridCard(index,context);
            }, childCount: student.length),
          )
        ],
      ),
    );
  }

}
Widget gridCard(int index,BuildContext context)
{
  return Padding(
    padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
    child:  Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
            },
            child: ListTile(
              leading: Container(
                height: 100,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              title: Text(student[index],style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w300),),
              subtitle: Text("abcd@gmail.com\n9876543210",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200),),
              trailing: Icon(Icons.arrow_forward_ios,size: 30,),
              contentPadding: EdgeInsets.only(left: 30,right: 30,bottom: 20),
            ),
          ),
        ),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade300,
        )
      ],
    )
  );
}