import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';


import 'BranchName.dart';
final string1 = ['CHEMICAL\nENGINEERING','CHEMISTRY','ENGINNERING\nPHYSICS','ENVIRONMENT','OIL','PETROLEUM'];
final string2 = ['MECHANICAL','MECHATRONICS','TEXTILE\nand\nCHEMISTRY','TEXTILE\nENGINEERING','TEXTILE\nTECHNOLGY'];
final string3 = ['INDUSTRIAL\nENGINEERING','INDUSTRIAL\nand\nPRODUCTION','MANUFACTURING','METALLURGY','MINING','PRODUCTION'];
final string4 = ['INSTRUMENTATION','LEATHER\nTECHNOLOGY','MAN MADE\nFIBRE','MARINE','NAVAL\nand\nOCEAN','PLASTIC','PAINT'];
final string5 = ['AGRICULTURAL','FOOD','BIOCHEMICAL','BIOMEDICAL','BIOTECHNOLOGY'];
final string6 = ['COMMUNICATION','ELECTRICAL','ELECTRONICS\nand\nCOMMUNICATION','ELECTRONICS\nand\nINSTRUMENTATION','ELECTRONICS\nand\nTELE\nCOMMUNICATIONS'];
final string7 = ['COMPUTER\nSCIENCE\nENGINEERING','INFORMATION\nTECHNOLOGY','ROBOTICS','AERONAUTICAL','AEROSPACE','AUTOMOBILE','TRANSPORT'];
final string8 = ['CERAMIC','CIVIL','CONSTRUCTION','STRUCTURAL\nENGINEERING'];
final branches = ['CHEMISTRY and PHYSICS','MECHANICAL and TEXTILE','INDUSTRIAL and PRODUCTION','TECHNICAL and TRANSPORT','ELECTRONICS','AGRICULTURE and BIOLOGY','CONSTRUCTION','OTHERS'];
enum _BgProps{color1,color2}

class Branchblog extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    final tween = MultiTween<_BgProps>()..add(_BgProps.color1,Color(0xffD38312).tweenTo(Colors.lightBlue.shade900))
      ..add(_BgProps.color2,Color(0xffA83279).tweenTo(Colors.blue.shade600));

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 900,
              width: double.infinity,
              child: MirrorAnimation<MultiTweenValues<_BgProps>>(
                tween: tween,
                duration: 3.seconds,
                builder: (context,child,value){
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              value.get(_BgProps.color1),
                              value.get(_BgProps.color2)
                            ]
                        )
                    ),
                  );
                },
              ),
            ),
            gridcard(0, context),
            gridcard(1, context),
            gridcard(2, context),
            gridcard(3, context),
            gridcard(4, context),
            gridcard(5, context),
            gridcard(6, context),
            gridcard(7, context)
          ],
        ),
      )
    );
  }

}
Widget gridcard(int index,BuildContext context){
  return Positioned(
      top: (index*100+100).toDouble(),
      left: 30,
      child:GestureDetector(
      onTap:(){
  if(index==0)
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchName(string1)));
  if(index==1)
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchName(string2)));
  if(index==2)
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchName(string3)));
  if(index==3)
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchName(string7)));
  if(index==4)
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchName(string6)));
  if(index==5)
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchName(string5)));
  if(index==6)
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchName(string8)));
  if(index==7)
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchName(string4)));


  },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width-60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(branches[index],style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
            Text('Few lines about each branch',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 15),),
          ],
        ),
      ),
    )
  );
}