import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:counselling_gurus/Pages/Mentor/PdfViewerMentor.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
final string1 = ['Chemical\nEngineering','Chemistry','Engineering\nPhysics','Environment','Oil','Petroleum'];
final string2 = ['Mechanical','Mechatronics','Textile\nand\nChemistry','Textile\nEngineering','Textile\nTechnology'];
final string3 = ['Industrial\nEngineering','Industrial\nand\nProduction','Manufacturing','Metallurgy','Mining','Production'];
final string4 = ['Instrumentation','Leather\nTechnology','Man Made\nFibre','Marine','Naval\nand\nOcean','Plastic','Paint'];
final string5 = ['Agriculture','Food','Biochemical','Biomedical','Biotechnology'];
final string6 = ['Communication','Electrical','Electronics\nand\nCommunication','Electronics\nand\nInstrumentation','Electronics\nand\nTele\nCommunications'];
final string7 = ['Computer\nScience\nEngineering','Information\nTechnology','Robotics','Aeronautical','Aerospace','Automobile','Transport'];
final string8 = ['Ceramic','Civil','Construction','Structural\nEngineering'];
final string = string1+string2+string3+string4+string5+string6+string7+string8;
final string10 = ['Chemical Engineering','Chemistry','Engineering Physics','Environment','Oil','Petroleum'];
final string20 = ['Mechanical','Mechatronics','Textile and Chemistry','Textile Engineering','Textile Technology'];
final string30 = ['Industrial Engineering','Industrial and Production','Manufacturing','Metallurgy','Mining','Production'];
final string40 = ['Instrumentation','Leather Technology','Man Made Fibre','Marine','Naval and Ocean','Plastic','Paint'];
final string50 = ['Agriculture','Food','Biochemical','Biomedical','Biotechnology'];
final string60 = ['Communication','Electrical','Electronics and Communication','Electronics and Instrumentation','Electronics and Tele Communications'];
final string70 = ['Computer Science Engineering','Information Technology','Robotics','Aeronautical','Aerospace','Automobile','Transport'];
final string80 = ['Ceramic','Civil','Construction','Structural Engineering'];
final stringfinal = string10+string20+string30+string40+string50+string60+string70+string80;
enum _BgProps{color1,color2}

class MedicalBranchName extends StatefulWidget{


  @override
  _MedicalBranchNameState createState() => _MedicalBranchNameState();
}

class _MedicalBranchNameState extends State<MedicalBranchName> {
  TextEditingController controller = new TextEditingController();
  ScrollController _controller;
  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();
  @override
  void initState(){
    _controller  = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_BgProps>()..add(_BgProps.color1,Color(0xffD38312).tweenTo(Colors.lightBlue.shade900))
      ..add(_BgProps.color2,Color(0xffA83279).tweenTo(Colors.blue.shade600));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward,color: Colors.white,),
        onPressed: (){
          setState(() {
            _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.bounceOut);
          });
        },
      ),
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
            ListView.builder(
              controller: _controller,
              itemCount: string.length+1,
              itemBuilder: (BuildContext context,int index){
                if(index==0)
                  return Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: AutoCompleteTextField<String>(
                          key: key,
                          controller: controller,
                          /*     textChanged: (stringfinal){
                          controller.text=stringfinal;
                        },*/
                          clearOnSubmit: false,
                          suggestions: stringfinal,
                          itemFilter: (item,query){
                            return item.toLowerCase().startsWith(query.toLowerCase());
                          },
                          itemSorter: (a,b){
                            return a.compareTo(b);
                          },
                          itemSubmitted: (stringitem){
                            setState(() {
                              controller.text=stringitem;
                              int i;
                              for(i=0;i<stringfinal.length;i++)
                              {
                                if(stringitem.compareTo(stringfinal[i])==0)
                                  break;
                              }
                              _controller.animateTo((60+i*150).toDouble(), duration: Duration(seconds: 1), curve: Curves.linear);
                            });
                          },
                          itemBuilder: (context,item){
                            return text(item);
                          },
                          style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      )
                  );
                else if(index%2==1)
                  return Padding(
                      padding: EdgeInsets.only(right: 200),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewer1()));
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.deepOrange,Colors.orangeAccent],
                                )
                            ),
                            child:Center(child: Text(string[index-1],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
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
                            child:Center(child: Text(string[index-1],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white),),)
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
Widget text(String item)
{
  return Column(
    children: <Widget>[
      Text(
        item,style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 1,
        color: Colors.grey,
      )
    ],
  );
}