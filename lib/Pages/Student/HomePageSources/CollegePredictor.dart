import 'dart:convert';

import 'package:counselling_gurus/Pages/Student/Fragments/NewsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import '../../../Resources/Colors.dart' as color;
import '../StudentPlanPopup.dart';
import 'package:http/http.dart' as http;

class CollegePredictor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollegePredictorState();
  }
}

class MyCollege {
  String a="";
  String b="";
  String c="";
  String d="";
  String e="";
  String f="";
  String g="";
  String h="";
  MyCollege({this.a,this.b,this.c,this.d,this.e,this.f,this.g,this.h});
  factory MyCollege.fromJson(Map<String,dynamic> json){
    return MyCollege(
      a: json["Round No"],
      b: json["Institute Name"],
      c: json["Branch Name"],
      d: json["Allotted Quota"],
      e: json["Category"],
      f: json["Seat Pool"],
      g: json["Openning Rank"],
      h: json["Closing Rank"],
    );
  }
}
var topColleges = [
  {
    "Round No": "7",
    "Institute Name": "Indian Institute  of Technology Bombay",
    "Branch Name": "Computer Science and Engineering (4 Years, Bachelor of Technology)",
    "Allotted Quota": "AI",
    "Category": "OPEN",
    "Seat Pool": "Gender-Neutral",
    "Openning Rank": "1",
    "Closing Rank": "63"
  },
  {
    "Round No": "7",
    "Institute Name": "Indian Institute  of Technology Delhi",
    "Branch Name": "Computer Science and Engineering (4 Years, Bachelor of Technology)",
    "Allotted Quota": "AI",
    "Category": "OPEN",
    "Seat Pool": "Gender-Neutral",
    "Openning Rank": "2",
    "Closing Rank": "93"
  },
  {
    "Round No": "7",
    "Institute Name": "Indian Institute  of Technology Madras",
    "Branch Name": "Computer Science and Engineering (4 Years, Bachelor of Technology)",
    "Allotted Quota": "AI",
    "Category": "OPEN",
    "Seat Pool": "Gender-Neutral",
    "Openning Rank": "90",
    "Closing Rank": "188"
  },
];
final myController = TextEditingController();
List<MyCollege> availablecolleges = new List();
String firstcollegename = "1st College Name";
String secondcollegename = "2nd College Name";
String thirdcollegename = "3rd College Name";
bool isLoading = false;
bool submitClicked = false;
class _CollegePredictorState extends State<CollegePredictor> {

  JsonDecoder jsonDecoder = new JsonDecoder();
  Map<String, dynamic> jsonData;
  // getCollegePrefs() async {
  //   String rankentered = myController.text;
  //   Uri uri =
  //       Uri.parse('http://192.168.43.70:3060/collegepredictor/$rankentered');
  //   http.Response response =
  //       await http.get(uri, headers: {"Accept": "application/json"});
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       jsonData = jsonDecoder.convert(response.body);
  //       setState(() {
  //         firstcollegename = jsonData["firstcollegename"];
  //         secondcollegename = jsonData["secondcollegename"];
  //         thirdcollegename = jsonData["thirdcollegename"];
  //         isLoading = false;
  //       });
  //     });
  //   }
  // }

  List<String> categoryList = ["OBC-NCL", "GEN-EWS","OPEN", "OPEN (PwD)", "SC","ST"];
  List<String> genderList = ["Gender-Neutral", "Female-Only"];
  List<DropdownMenuItem<String>> categoryDropDown;
  List<DropdownMenuItem<String>> genderDropDown;
  String selectedItem, selectedItem1;

  bool checkbox = false;

  @override
  void initState() {
    // isLoading = true;
    // getCollegePrefs();
    checkbox = false;
    categoryDropDown = buildDropDownMenuItems(categoryList);
    genderDropDown = buildDropDownMenuItems(genderList);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    myController.text='';
    submitClicked=false;
  }
  List<DropdownMenuItem<String>> buildDropDownMenuItems(categoryList) {
    List<DropdownMenuItem<String>> items = List();
    for (String category in categoryList) {
      items.add(DropdownMenuItem(
        value: category,
        child: Text(category),
      ));
    }
    return items;
  }

  onChangeDropDownItem(String item) {
    setState(() {
      selectedItem = item;
    });
  }

  onChangeDropDownItem1(String item) {
    setState(() {
      selectedItem1 = item;
    });
  }
  Future<MyCollege> createColleges(a,b,c) async {
    print(a);
    var map = new Map<String, dynamic>();
    map['rank'] = a;
    map['category'] = b;
    map['seatPool'] = c;

    await http.post(
      'http://10.0.0.11:3001/app/predictor-advanced',
       body: map,
    ).then((response){

     var mine = jsonDecode(response.body);
     for(int i=0;i<mine.length;i++) {
       var av = MyCollege.fromJson(mine[i]);
       availablecolleges.add(av);
     }

     setState(() {
       print(availablecolleges.length);
       submitClicked = true;
     });

    })
    .catchError(throw Exception('failed to load'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: SingleChildScrollView(
              child: ColumnSuper(
                innerDistance: -50,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                color.bgGrad,
                                color.bgGrad1,
                                color.bgGrad2,
                                color.bgGrad3
                              ])),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 70,
                          ),
                          ListTile(
                            title: Text(
                              'WELCOME TO COLLEGE PREDICTOR',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(
                              children: <Widget>[
                                Theme(
                                  data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: myController,
                                      autofocus: false,
                                      style: GoogleFonts.aBeeZee(fontSize: 15),
                                      decoration: InputDecoration(
                                          hintText:
                                          "Enter Your JEE Mains Rank Here",
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.only(
                                              left: 40, right: 40),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.white),
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.white),
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.orangeAccent),
                                    ),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 40, right: 40),
                                      child: DropdownButton(
                                        iconEnabledColor: Colors.black,
                                        iconDisabledColor: Colors.black,
                                        hint: Text("Select Category"),
                                        isExpanded: true,
                                        value: selectedItem,
                                        items: categoryDropDown,
                                        onChanged: onChangeDropDownItem,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.orangeAccent),
                                    ),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 40, right: 40),
                                      child: DropdownButton(
                                        iconEnabledColor: Colors.black,
                                        iconDisabledColor: Colors.black,
                                        hint: Text("Select Gender"),
                                        isExpanded: true,
                                        value: selectedItem1,
                                        items: genderDropDown,
                                        onChanged: onChangeDropDownItem1,
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: RaisedButton(
                                    onPressed: () {
                                      setState(() {
                                        if(myController.text!=''&&selectedItem!=null&&selectedItem1!=null)
                                        {
                                          availablecolleges.clear();
                                          submitClicked=loader;
                                           createColleges(myController.text,selectedItem,selectedItem1);
                                           print(availablecolleges.length);
                                        }
                                        else
                                          {
                                            Toast.show("Please sellect all fields for accurate results.", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                          }
                                      });
                                    },
                                    child: Text('SUBMIT'),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                      color: Colors.white
                    ),
                    child: Colleges(),
                  )
                ],
              ),
            ),
          ));
  }
}

class Colleges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(submitClicked==loader&&submitClicked!=false)
      {
        print(submitClicked);
        return Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            )
          ),
        );
      }
    else if (!submitClicked) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: MediaQuery.of(context).size.width,
          ),
          Text("TOP COLLEGES AND BRANCHES", style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
              fontSize: 22),
          ),
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
          ),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              ListView.builder(
                  itemCount: topColleges.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return gridCard(index,context);
                  }
              ),
            ],
          )
        ],
      );
    }
    else {
      return Column(
        children: <Widget>[
           SizedBox(
              height: 10,
             width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("HERE ARE OPTIONS AVAILABLE FOR YOU", style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                  fontSize: 18),
              ),
            ),
           SizedBox(
              height: 20,
             width: MediaQuery.of(context).size.width,
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: availablecolleges.length,
                    itemBuilder: (context,index){
                      return gridCard1(index,context);
                    }
                ),
              ],
            )
        ],
      );
    }
  }


  Widget gridCard(int index,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width-40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(topColleges[index]['Institute Name'],style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child:  Text(topColleges[index]['Branch Name'],style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Opening Rank- '+topColleges[index]['Openning Rank'],style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Closing Rank- '+topColleges[index]['Closing Rank'],style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget gridCard1(int index,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width-40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(availablecolleges[index].b,style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child:  Text(availablecolleges[index].c,style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Opening Rank- '+availablecolleges[index].g,style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Closing Rank- '+availablecolleges[index].h,style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300),),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}