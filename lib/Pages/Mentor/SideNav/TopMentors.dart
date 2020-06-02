import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final names = ['NAME 1','NAME 2','NAME 3'];
class TopMentors extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text('TOP MENTORS',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 25),),

                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return InfoCard(index,context);
            }, childCount: names.length),
          ),
        ],
      ),
    );
  }

}
Widget InfoCard(int index,BuildContext context){
  return Padding(
    padding: EdgeInsets.all(20),
    child: Material(
      elevation: 30,
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width-40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width-40,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
            ),
          ),
          Positioned(
            top: 120,
            child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width-40,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    Center(
                      child: Container(
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(names[index],style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w100),),
                              ),
                              Center(
                                child: Text('GRADUATION',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w100),),
                              ),
                              Center(
                                child: Text('abcd1234@gmail.com',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w100),),
                              ),
                              Center(
                                child: Text('9876543210',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w100),),
                              ),
                              Center(
                                child: Text('COLLEGE NAME',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w100),),
                              ),
                            ],
                          )
                      ),
                    )
                  ],
                )
            ),
          ),
          Positioned(
            top: 70,
            left: MediaQuery.of(context).size.width/3,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.fill,
                  )
              ),
            ),
          )
        ],
      ),
    )
  );
}