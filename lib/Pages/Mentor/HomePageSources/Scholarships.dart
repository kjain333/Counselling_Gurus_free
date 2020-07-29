import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final string = ["Academic Scholarships","Minority Scholarships","Educational Loans"];
class Scholarships extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverList(
              delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
                return myCard(index,context);
              }, childCount: string.length),
            )
          ],
        )
      );
  }

}
Widget myCard(int index,BuildContext context)
{
  return Padding(
    padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
    child: Material(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent,Colors.blue,Colors.purpleAccent],
                    stops: [0.3,0.6,1]
                )
            ),
          ),
          ClipPath(
            clipper: CustomClipperPath(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 105,
                  ),
                  Center(
                    child: ListTile(
                      title: Text("Scholarship Name",style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.bold),),
                      subtitle: Text("Here we will give few essential details about the scholarship",style:GoogleFonts.aBeeZee(fontSize: 14,fontWeight: FontWeight.w200),),
                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.pinkAccent,
                    child: Text(
                      "Proceed Now", style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16),
                    ),
                    onPressed: (){
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.school,color: Colors.white,),
              title: Text(string[index],style: GoogleFonts.aBeeZee(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.white),),
            ),
          )
        ],
      ),
      elevation: 20,
    )
  );
}
class CustomClipperPath extends CustomClipper<Path>{

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0,80.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 80.0);
    path.quadraticBezierTo(size.width*3/4, 100.0, size.width/2, 80.0);
    path.quadraticBezierTo(size.width/4, 60.0, 0.0, 80.0);
    path.close();
    return path;
  }
}