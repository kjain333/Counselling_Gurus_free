import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Resources/Colors.dart' as color;
import 'package:counselling_gurus/Pages/Student/HomePageSources/CollegeInfo.dart';

class CollegeName extends StatefulWidget{
  CollegeName(this.collegelists);
  final List<String> collegelists;
  _CollegeName createState() => _CollegeName(collegelists);
}
class _CollegeName extends State<CollegeName>{
  _CollegeName(this.collegeLists);
  final List<String> collegeLists;
  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();
  TextEditingController controller = new TextEditingController();
  ScrollController _controller;
  @override
  void initState(){
    _controller  = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward,color: Colors.white,),
        onPressed: (){
          setState(() {
            _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.bounceOut);
          });
        },
      ),
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 80),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    controller: _controller,
                    itemCount: collegeLists.length+1,
                    itemBuilder: (BuildContext context, int index) {
                      if(index == 0)
                        return Padding(
                            padding: EdgeInsets.all(30),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: AutoCompleteTextField<String>(
                                controller: controller,
                                key: key,
                                /*     textChanged: (stringfinal){
                          controller.text=stringfinal;
                        },*/
                                clearOnSubmit: false,
                                suggestions: collegeLists,
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
                                    for(i=0;i<collegeLists.length;i++)
                                    {
                                      if(stringitem.compareTo(collegeLists[i])==0)
                                        break;
                                    }
                                    _controller.animateTo((120+i*160).toDouble(), duration: Duration(seconds: 1), curve: Curves.linear);
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
                      else
                      return buildList(context, index-1);
                    }),
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color.bgGrad,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Institutes",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>CollegeInfo()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 140,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Padding(
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: color.secondary),
                  image: DecorationImage(
                      image: AssetImage("assets/images/app_logo.png",),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      collegeLists[index],
                      style: TextStyle(
                          color: color.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: color.secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("location",
                            style: TextStyle(
                                color: color.primary, fontSize: 13, letterSpacing: .3)),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.school,
                          color: color.secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("type",
                            style: TextStyle(
                                color: color.primary, fontSize: 13, letterSpacing: .3)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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