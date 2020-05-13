import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
enum _BgProps{color1,color2}

class Branchblog extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    final tween = MultiTween<_BgProps>()..add(_BgProps.color1,Color(0xffD38312).tweenTo(Colors.lightBlue.shade900))
      ..add(_BgProps.color2,Color(0xffA83279).tweenTo(Colors.blue.shade600));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
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
          Positioned(
              left: 20,
              top: 50,
              child: InkWell(
                onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => BranchName(string1)));},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(child: Text('CHEMISTRY and PHYSICS',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                  ),
                ),
              )

          ),
          Positioned(
              left: 260,
              top: 50,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BranchName(string2)));},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child:Center(child: Text('MECHANICAL and TEXTILE',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                  ),
                ),
              )

          ),
          Positioned(
              left: 140,
              top: 200,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BranchName(string3)));},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child:Center(child: Text('INDUSTRIAL and PRODUCTION',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                  ),
                ),
              )

          ),
          Positioned(
              left: 20,
              top: 350,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BranchName(string5)));} ,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child:Center(child: Text('AGRICULTURE and BIOLOGY',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                  ),
                ),
              )

          ),
          Positioned(
              left: 260,
              top: 350,
              child:InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BranchName(string8)));},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child:Center(child: Text('CONSTRUCTION',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                  ),
                ),
              )

          ),
          Positioned(
              left: 140,
              top: 500,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BranchName(string4)));},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child:Center(child: Text('OTHERS',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                  ),
                ),
              )

          ),
          Positioned(
              left: 20,
              top: 650,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BranchName(string6)));},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child:Center(child: Text('ELECTRONICS',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                  ),
                ),
              )

          ),
          Positioned(
            left: 260,
            top: 650,
            child:InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BranchName(string7)));},
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child:Center(child: Text('TECHNICAL and TRANSPORT',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
                ),
              ),

            ),
          )
        ],
      ),
    );
  }

}
