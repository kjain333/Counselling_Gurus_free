import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Resources/Colors.dart' as color;
import '../StudentPlanPopup.dart';
import 'package:http/http.dart' as http;

class CollegePredictor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollegePredictorState();
  }
}

final myController = TextEditingController();

String firstcollegename = "1st College Name";
String secondcollegename = "2nd College Name";
String thirdcollegename = "3rd College Name";
bool isLoading = false;

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

  List<String> categoryList = ["General", "St Sc", "OBC", "EWS"];
  List<String> genderList = ["Male", "Female", "Others"];
  List<DropdownMenuItem<String>> categoryDropDown;
  List<DropdownMenuItem<String>> genderDropDown;
  String selectedItem, selectedItem1;
  bool submitClicked = false;
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

  @override
  Widget build(BuildContext context) {
    // TODO implement the isloading feature here to include the circular progress bar indicator 
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
                      height: 550,
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width / 4,
                                      vertical: 10),
                                  child: CheckboxListTile(
                                    title: Text(
                                      'PWD',
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    value: checkbox,
                                    activeColor: Colors.orangeAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkbox = !checkbox;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: RaisedButton(
                                    onPressed: () {
                                      setState(() {
                                        submitClicked = true;
                                      });
                                    },
                                    child: Text('SUBMIT'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    elevation: 20,
                    color: Colors.white,
                    child: submitClicked
                        ? Container(child: Colleges())
                        : Container(
                            height: 1030,
                            width: 440,
                          ),
                  ),
                ],
              ),
            ),
          ));
  }
}

class Colleges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (myController.text == '')
      return Container(
        height: 1030,
        width: 440,
      );
    else {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'HERE ARE OPTIONS AVAILABLE FOR YOU',
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Material(
              elevation: 30,
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 120,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 15,),
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
                              'College Name',
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
                                Text("Location",
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
                                Text("Branch Name",
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
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Material(
              elevation: 30,
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 120,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 15,),
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
                              'College Name',
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
                                Text("Location",
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
                                Text("Branch Name",
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
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Material(
              elevation: 30,
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 120,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 15,),
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
                              'College Name',
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
                                Text("Location",
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
                                Text("Branch Name",
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
            ),
          ),
          SizedBox(
            height: 50,
            child: ListTile(
              leading: Icon(Icons.arrow_drop_down),
              title: Text('READ MORE'),
              contentPadding: EdgeInsets.only(left: 100, right: 100),
              onTap: () {
                popup(context);
              },
            ),
          )
        ],
      );
    }
  }
}
