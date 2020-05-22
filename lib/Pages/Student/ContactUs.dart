import 'package:counselling_gurus/Pages/Student/Medical/MedicalBranchblog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final names = ['NAME 1','NAME 2','NAME 3'];
class ContactUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50,),
                Center(child: Text('CONTACT US',style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold),),)
              ],
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return InfoCard(index,context);
            }, childCount: names.length),
          )
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
      color: Colors.blueGrey,
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width-100,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 20,
              top: 20,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.fill,
                  )

                ),
              ),
            ),
            Positioned(
              left: 150,
              top: 20,
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width-200,
                child: Text('Name: '+names[index]+'\nContact No. : 9876543210\nEmail ID : abcd1234@gmail.com\nPost: General Manager',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 15),),
              ),
            )
          ],
        ),
      ),
    ),
  );
}