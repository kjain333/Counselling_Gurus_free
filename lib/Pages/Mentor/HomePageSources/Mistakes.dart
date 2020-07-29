import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipedetector/swipedetector.dart';
import '../../../Resources/Colors.dart' as color;
var colors = [color.orange5,color.pink9];
class Mistakes extends StatefulWidget{
  _Mistakes createState() => _Mistakes();
}
class _Mistakes extends State<Mistakes>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text("Here are some common mistakes committed by students. Make sure you are not one of them",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Mylist(index,context);
            }, childCount: 5),
          )
        ],
      ),
    );
  }
  Widget Mylist(int index,BuildContext context){
    if(index%2==0)
    {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: <Widget>[
          Container(
              width: 300.0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Mistake "+(index+1).toString()+ ", details about the the mistake in complete detail",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
          ),
          ClipPath(
            clipper: CustomClipperPath(),
            child: Container(
                width: 300.0,
                color: colors[0],
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Mistake "+(index+1).toString()+ ", details about the the mistake in complete detail",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ),
          ),
          Container(
              width: 300.0,
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Mistake "+(index+1).toString()+ ", details about the the mistake in complete detail",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                onTap: (){
                  setState(() {
                    return null;
                  });
                },

              )
          )
        ],
      ),
    );
  }
  else{
       return Padding(
         padding: EdgeInsets.only(bottom: 20,left: MediaQuery.of(context).size.width-300.0),
         child: Stack(
           children: <Widget>[
             Container(
                 width: 300.0,
                 child: Column(
                   children: <Widget>[
                     SizedBox(
                       height: 20,
                     ),
                     Padding(
                       padding: EdgeInsets.all(20),
                       child: Text("Mistake "+(index+1).toString()+ ", details about the the mistake in complete detail",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                   ],
                 )
             ),
             ClipPath(
               clipper: CustomClipperPath1(),
               child: Container(
                   width: 300.0,
                   color: colors[1],
                   child: Column(
                     children: <Widget>[
                       SizedBox(
                         height: 20,
                       ),
                       Padding(
                         padding: EdgeInsets.all(20),
                         child: Text("Mistake "+(index+1).toString()+ ", details about the the mistake in complete detail",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                     ],
                   )
               ),
             ),
             Container(
                 width: 300.0,
                 child: GestureDetector(
                   child: Column(
                     children: <Widget>[
                       SizedBox(
                         height: 20,
                       ),
                       Padding(
                         padding: EdgeInsets.all(20),
                         child: Text("Mistake "+(index+1).toString()+ ", details about the the mistake in complete detail",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                     ],
                   ),
                   onTap: (){
                     setState(() {
                        return null;
                     });
                   },

                 )
             )
           ],
         ),
       );
    }
  }
}

class CustomClipperPath extends CustomClipper<Path>{

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0,0.0);
    path.lineTo(size.width-20, 0.0);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width-20, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
}
class CustomClipperPath1 extends CustomClipper<Path>{

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width,0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(20.0, size.height);
    path.lineTo(0.0, size.height/2);
    path.lineTo(20.0, 0.0);
    path.close();
    return path;
  }
}
