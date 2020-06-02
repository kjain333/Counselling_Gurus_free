import 'package:counselling_gurus/Pages/Mentor/PdfViewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../PdfViewer.dart';

final string1 = ['Chemical\nEngineering','Chemistry','Engineering\nPhysics','Environment','Oil','Petroleum'];
final string2 = ['Mechanical','Mechatronics','Textile\nand\nChemistry','Textile\nEngineering','Textile\nTechnology'];
final string3 = ['Industrial\nEngineering','Industrial\nand\nProduction','Manufacturing','Metallurgy','Mining','Production'];
final string4 = ['Instrumentation','Leather\nTechnology','Man Made\nFibre','Marine','Naval\nand\nOcean','Plastic','Paint'];
final string5 = ['Agriculture','Food','Biochemical','Biomedical','Biotechnology'];
final string6 = ['Communication','Electrical','Electronics\nand\nCommunication','Electronics\nand\nInstrumentation','Electronics\nand\nTele\nCommunications'];
final string7 = ['Computer\nScience\nEngineering','Information\nTechnology','Robotics','Aeronautical','Aerospace','Automobile','Transport'];
final string8 = ['Ceramic','Civil','Construction','Structural\nEngineering'];
final string = string1+string2+string3+string4+string5+string6+string7+string8;
class BranchName extends StatefulWidget{
  @override
  _BranchNameState createState() => _BranchNameState();
}

class _BranchNameState extends State<BranchName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo,Colors.lightBlueAccent]
                  )
              ),
            ),
            ListView.builder(
              itemCount: string.length,
              itemBuilder: (BuildContext context,int index){
                if(index%2==0)
                  return Padding(
                      padding: EdgeInsets.only(right: 200),
                      child: GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewer1()));},
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.deepOrange,Colors.orangeAccent],
                                )
                            ),
                            child:Center(child: Text(string[index],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white,decoration: TextDecoration.none),),)
                        ),
                      )
                  );
                else
                  return Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewer1()));},
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.purple,Colors.pinkAccent],
                                )
                            ),
                            child:Center(child: Text(string[index],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white,decoration: TextDecoration.none),),)
                        ),
                      )
                  );
              },
            )
          ]
      ),
    );
  }
}