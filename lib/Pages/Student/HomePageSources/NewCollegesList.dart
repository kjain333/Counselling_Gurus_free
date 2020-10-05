import 'dart:convert';
import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/CollegeInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/io_client.dart';
class MyCollege {
  String a="";
  int b= 0;
  String c = "";
  MyCollege({this.a,this.b,this.c});
  factory MyCollege.fromJson(Map<String,dynamic> json){
    return MyCollege(
      a: json["_id"],
      b: json["sno"],
      c: json["name"],
    );
  }
}
class CollegesList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CollegesList();
  }
}
bool loading = true;
List<String> CollegesName = new List();
List<String> CollegesId = new List();
class _CollegesList extends State<CollegesList>{
  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();
  TextEditingController controller = new TextEditingController();
  ScrollController _controller;
  Future<void> getColleges() async{
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    http.get("https://counsellinggurus.in:3001/s/enginerring/all").then((response){
      var data = jsonDecode(response.body);
      print(response.body);
      for(int i=0;i<data.length;i++)
        {
          MyCollege mydata = MyCollege.fromJson(data[i]);
          CollegesName.add(mydata.c);
          CollegesId.add(mydata.b.toString());
        }
      setState(() {
        loading = false;
      });
    }).catchError(throw Exception('failed to load'));

  }
  Future<void> getColleges1() async{
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    http.get("https://counsellinggurus.in:3001/s?search=NIT").then((response){
      var data = jsonDecode(response.body);
      print(response.body);
      for(int i=0;i<data.length;i++)
      {
        MyCollege mydata = MyCollege.fromJson(data[i]);
        CollegesName.add(mydata.c);
        CollegesId.add(mydata.b.toString());
      }
      setState(() {

      });
    }).catchError(throw Exception('failed to load'));

  }
  Future<void> getColleges2() async{
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    http.get("https://counsellinggurus.in:3001/s?search=BITS").then((response){
      var data = jsonDecode(response.body);
      print(response.body);
      for(int i=0;i<data.length;i++)
      {
        MyCollege mydata = MyCollege.fromJson(data[i]);
        CollegesName.add(mydata.c);
        CollegesId.add(mydata.b.toString());
      }
      setState(() {

      });
    }).catchError(throw Exception('failed to load'));

  }
  Future<void> getColleges4() async{
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    http.get("https://counsellinggurus.in:3001/s?search=MNIT").then((response){
      var data = jsonDecode(response.body);
      print(response.body);
      for(int i=0;i<data.length;i++)
      {
        MyCollege mydata = MyCollege.fromJson(data[i]);
        CollegesName.add(mydata.c);
        CollegesId.add(mydata.b.toString());
      }
      setState(() {

      });
    }).catchError(throw Exception('failed to load'));

  }
  Future<void> getColleges3() async{
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    http.get("https://counsellinggurus.in:3001/s?search=VIT").then((response){
      var data = jsonDecode(response.body);
      print(response.body);
      for(int i=0;i<data.length;i++)
      {
        MyCollege mydata = MyCollege.fromJson(data[i]);
        CollegesName.add(mydata.c);
        CollegesId.add(mydata.b.toString());
      }
      setState(() {
        loading=false;
      });
    }).catchError(throw Exception('failed to load'));

  }
  @override
  void initState() {
    getColleges();
    _controller  = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return (loading==true)?Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    ):Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_upward,color: Colors.white,),
          onPressed: (){
            setState(() {
              _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.bounceOut);
            });
          },
        ),
        backgroundColor: Color(0xfff0f0f0),
      body: ListView.builder(
          controller: _controller,
          itemCount: CollegesName.length+1,
          itemBuilder: (context,index){
            if(index==0)
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
                        suggestions: CollegesName,
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
                            for(i=0;i<CollegesName.length;i++)
                            {
                              if(stringitem.compareTo(CollegesName[i])==0)
                                break;
                            }
                            _controller.animateTo((120+i*80).toDouble(), duration: Duration(seconds: 1), curve: Curves.linear);
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
            else if(index==1)
              return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5,bottom: 5),
                    child: Container(
                      height: 1,
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                    title: Text(CollegesName[index-1],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 16),),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CollegeInfo(CollegesId[index-1])));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5,bottom: 5),
                    child: Container(
                      height: 1,
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              );
            else
              return Container(
                height: 80,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                        title: Text(CollegesName[index-1],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 16),),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CollegeInfo(CollegesId[index-1])));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5,bottom: 5),
                        child: Container(
                          height: 1,
                          color: Colors.black,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                )
              );
          })
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