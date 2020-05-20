import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Resources/Colors.dart' as color;
import '../StudentPlanPopup.dart';

class MedicalCollegePredictor extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MedicalCollegePredictorState();
  }
}

final myController = TextEditingController();

class _MedicalCollegePredictorState extends State<MedicalCollegePredictor>{

  List<String> categoryList = ["General", "St Sc", "OBC", "Minorities", "Girls"];
  List<DropdownMenuItem<String>> categoryDropDown;
  String selectedItem;
  bool submitClicked = false;

  @override
  void initState() {
    categoryDropDown = buildDropDownMenuItems(categoryList);
    super.initState();
  }

  List<DropdownMenuItem<String>> buildDropDownMenuItems(categoryList){
    List<DropdownMenuItem<String>> items = List();
    for(String category in categoryList){
      items.add(DropdownMenuItem(value: category, child: Text(category),));
    }
    return items;
  }

  onChangeDropDownItem(String item){
    setState(() {
      selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus = FocusScope.of(context);
            if(!currentFocus.hasPrimaryFocus){
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: ColumnSuper(
              innerDistance: -50,
              children: <Widget>[
                Container(
                  height: 430,
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
                        ]
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 70,
                      ) ,
                      ListTile(
                        title: Text('WELCOME TO COLLEGE PREDICTOR',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              Theme(
                                data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: myController,
                                    autofocus: false,
                                    style: GoogleFonts.aBeeZee(fontSize: 15),
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Rank Here",
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.only(left: 40,right: 40),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.orangeAccent),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 40, right: 40),
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
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: RaisedButton(
                                        onPressed: (){
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
                  )
                ),
                Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
                  elevation: 20,
                  color: Colors.white,
                  child: submitClicked ? Container(
                    child: Colleges()
                  ):
                  Container(
                    height: 1030,
                    width: 440,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

class Colleges extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
       if(myController.text == '')
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
                     child: Text('HERE ARE OPTIONS AVAILABLE FOR YOU',
                       style: TextStyle(color: Colors.lightBlueAccent,
                           fontSize: 15,
                           fontWeight: FontWeight.w500),),
                   )
               ),
             ),
             Padding(
               padding: EdgeInsets.all(30),
               child: Material(
                   elevation: 20,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                   child: Column(
                     children: <Widget>[
                       Container(
                         height: 200,
                         decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10),
                                 topRight: Radius.circular(10)),
                             image: DecorationImage(
                                 image: new AssetImage(
                                     'assets/images/college.png'),
                                 fit: BoxFit.fill
                             )
                         ),
                       ),
                       ListTile(
                           title: Text("COLLEGE NAME",
                             style: GoogleFonts.aBeeZee(fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),),
                           subtitle: Text("BRANCH NAME",
                             style: GoogleFonts.aBeeZee(
                                 fontSize: 10, color: Colors.black),)
                       ),
                     ],
                   )
               ),
             ),
             Padding(
               padding: EdgeInsets.all(20),
               child: Material(
                   elevation: 20,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))),
                   child: Column(

                     children: <Widget>[
                       Container(
                         height: 200,
                         decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10),
                                 topRight: Radius.circular(10)),
                             image: DecorationImage(
                                 image: new AssetImage(
                                     'assets/images/college.png'),
                                 fit: BoxFit.fill
                             )
                         ),
                       ),
                       ListTile(
                           title: Text("COLLEGE NAME",
                             style: GoogleFonts.aBeeZee(fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),),

                           subtitle: Text("BRANCH NAME",
                             style: GoogleFonts.aBeeZee(
                                 fontSize: 10, color: Colors.black),)

                       ),

                     ],
                   )
               ),
             ),
             Padding(
               padding: EdgeInsets.all(20),
               child: Material(
                   elevation: 20,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))),
                   child: Column(

                     children: <Widget>[
                       Container(
                         height: 200,
                         decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10),
                                 topRight: Radius.circular(10)),
                             image: DecorationImage(
                                 image: new AssetImage(
                                     'assets/images/college.png'),
                                 fit: BoxFit.fill
                             )
                         ),
                       ),
                       ListTile(
                           title: Text("COLLEGE NAME",
                             style: GoogleFonts.aBeeZee(fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black),),

                           subtitle: Text("BRANCH NAME",
                             style: GoogleFonts.aBeeZee(
                                 fontSize: 10, color: Colors.black),)

                       ),

                     ],
                   )
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
