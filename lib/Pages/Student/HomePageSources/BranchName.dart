import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../PdfViewer.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

/*final string1 = ['Chemical\nEngineering','Chemistry','Engineering\nPhysics','Environment','Oil','Petroleum'];
final string2 = ['Mechanical','Mechatronics','Textile\nand\nChemistry','Textile\nEngineering','Textile\nTechnology'];
final string3 = ['Industrial\nEngineering','Industrial\nand\nProduction','Manufacturing','Metallurgy','Mining','Production'];
final string4 = ['Instrumentation','Leather\nTechnology','Man Made\nFibre','Marine','Naval\nand\nOcean','Plastic','Paint'];
final string5 = ['Agriculture','Food','Biochemical','Biomedical','Biotechnology'];
final string6 = ['Communication','Electrical','Electronics\nand\nCommunication','Electronics\nand\nInstrumentation','Electronics\nand\nTele\nCommunications'];
final string7 = ['Computer\nScience\nEngineering','Information\nTechnology','Robotics','Aeronautical','Aerospace','Automobile','Transport'];
final string8 = ['Ceramic','Civil','Construction','Structural\nEngineering'];*/
List<String> string = new List();
/*final string10 = ['Chemical Engineering','Chemistry','Engineering Physics','Environment','Oil','Petroleum'];
final string20 = ['Mechanical','Mechatronics','Textile and Chemistry','Textile Engineering','Textile Technology'];
final string30 = ['Industrial Engineering','Industrial and Production','Manufacturing','Metallurgy','Mining','Production'];
final string40 = ['Instrumentation','Leather Technology','Man Made Fibre','Marine','Naval and Ocean','Plastic','Paint'];
final string50 = ['Agriculture','Food','Biochemical','Biomedical','Biotechnology'];
final string60 = ['Communication','Electrical','Electronics and Communication','Electronics and Instrumentation','Electronics and Tele Communications'];
final string70 = ['Computer Science Engineering','Information Technology','Robotics','Aeronautical','Aerospace','Automobile','Transport'];
final string80 = ['Ceramic','Civil','Construction','Structural Engineering'];*/
var branchdata = [
    {
      "Branch Name": "Aerospace\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/11u7knpVZjKcXWuhXz5XTRmEdyNQmH7iY/export/pdf"
    },
    {
      "Branch Name": "Agricultural\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1awjBo_O6Dl1E68eUzMENq0_J2SOhmYYZ2qkZQY5Ozww/export/pdf"
    },
    {
      "Branch Name": "Automobile\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1EFE_f5MuPfcWCK5wA_2V2FW1zy6RUT6K/export/pdf"
    },
    {
      "Branch Name": "Biochemical\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1cUCfkuOVRxI5mbkoNSqUpagSElQ1GYUX/export/pdf"
    },
    {
      "Branch Name": "Biomedical\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1eUhyBoLEUY7gMviWb7w5maXQYaQ08OBEER1uAh7EwLg/export/pdf"
    },
    {
      "Branch Name": "Biotechnology\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1mSrWMefaIkErR6pG5w42JgDMn_8K4S6CE1QnU0QQWeY/export/pdf"
    },
    {
      "Branch Name": "Ceramic\nEngineering"
    },
    {
      "Branch Name": "Chemical\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1FRx-C7yXSQzxpBIwTPGaI_NBl4NjrFcX/export/pdf"
    },
    {
      "Branch Name": "Civil\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1ttbo_R6Pj8eRa5Uw-ZivxJSlYLyAx-33pOuJ5_rohPI/export/pdf"
    },
    {
      "Branch Name": "Communications\nEngineering"
    },
    {
      "Branch Name": "Computer\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1XxcKUn9MtfMQvRwS9p_iFJqSQxnHBQ6M/export/pdf"
    },
    {
      "Branch Name": "Computer\nScience\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/18GVObmvIrQsq-Qw4AhS2MVSgdHSoz4G-/export/pdf"
    },
    {
      "Branch Name": "Construction\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1sSvU8eVVo9Y2yakaqpXmO60_M6g8_6GX/export/pdf"
    },
    {
      "Branch Name": "Electrical\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/18-6VHLEZRSMJoZZOrN5ZoS01piG6j_o4/export/pdf"
    },
    {
      "Branch Name": "Electronics &\nCommunication\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/u/1/d/1_QXba0mA3YMLraMBXoGiFuIeByM48Xl/export/pdf"
    },
    {
      "Branch Name": "Electrical and\nInstrumentation\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1jSlI9Aj0gxpWlokZ711Gkr5YTy6phjMz/export/pdf"
    },
    {
      "Branch Name": "Electronics\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1ztM02S25SRoh6oc9-QiuhHe475BZnnUqexDH4V1xquM/export/pdf"
    },
    {
      "Branch Name": "Electronics and\nInstrumentation\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1NQQ00rJE0487iT1sgcOTAN3MPsEW4UIMxd94b8ECous/export/pdf"
    },
    {
      "Branch Name": "Electronics &\nTelecommunication\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/u/1/d/1KpOGWS_3H801g7G7AMmgE9EkaEiBeyk-/export/pdf"
    },
    {
      "Branch Name": "Engineering\nPhysics",
      "PPT Link": "https://docs.google.com/presentation/d/1pNCvp1CWiC77XcNeC1FK1RbHrneKlK8ZknbYkZFEN-s/export/pdf"
    },
    {
      "Branch Name": "Environmental\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1-lOqI56DN61bpudye5tUaQxHXcT1BO_7/export/pdf"
    },
    {
      "Branch Name": "Food\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1clFcgfJXlTIDJcL-hzOHavxUZlkU3LdD/export/pdf"
    },
    {
      "Branch Name": "Industrial\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/10biNXVSDPPxApgCq5AQ3SLVc0rzI8K5o0BM2PSNe_ng/export/pdf"
    },
    {
      "Branch Name": "Industrial and\nProduction\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/u/1/d/1FaWdGrDORCB7p3I8Uex67A4LAAw7oYVF/export/pdf"
    },
    {
      "Branch Name": "Information\nTechnology\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1VuI7KeNn05fg1wl1xOhcK2xE9hNy7wkN/export/pdf"
    },
    {
      "Branch Name": "Instrumentation\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1SHysoWSJdbJpQETGEYaemsg8AqRwQRYT/export/pdf"
    },
    {
      "Branch Name": "Leather\nTechnology",
      "PPT Link": "https://docs.google.com/presentation/u/1/d/16UvUhGyhNEdWkmmJWtxyqesXI2x5RRxR/export/pdf"
    },
    {
      "Branch Name": "Material\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1DXjfOMePHx4l_619LgmFjz3MKXkI9ocKTGsvul7dZA8/export/pdf"
    },
    {
      "Branch Name": "Man Made\nFibre\nTechnology",
      "PPT Link": "https://docs.google.com/presentation/d/1MhkLWGTYSV6l4QuB0LPnvGYJty4_ujdpMwASzkhZtk4/export/pdf"
    },
    {
      "Branch Name": "Marine\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1OiQ7t3bCfENAQl4_dgqa8PJbCvLDf5wG/export/pdf"
    },
    {
      "Branch Name": "Mathematics",
      "PPT Link": "https://docs.google.com/presentation/d/1L5O9HqmMK2h4A2b9w82-vYHHwl3N_E2RQGVx0gQ9M-k/export/pdf"
    },
    {
      "Branch Name": "Mechatronics\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/122lixZVLCc8GVs6BZ8DZ_AssuAQO07VX/export/pdf"
    },
    {
      "Branch Name": "Metallurgical\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1sAA8QEnUUfSaEaWmM74UbNTaHRy9UJ5t/export/pdf"
    },
    {
      "Branch Name": "Mining\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1uY_EcNEjptNht5jfJrbhOd8R1a1rzm3SFn1cL1B9nR0/export/pdf"
    },
    {
      "Branch Name": "Oil\nTechnology",
      "PPT Link": "https://docs.google.com/presentation/d/17J3WrN_tEKnYulNfCEii-uc-Q-c4hTLt/export/pdf"
    },
    {
      "Branch Name": "Petroleum\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1nAWJonhjTQXtF8zJBSutqCWfRc2AB8NM/export/pdf"
    },
    {
      "Branch Name": "Plastic\nTechnology",
      "PPT Link": "https://docs.google.com/presentation/d/156iVE1ksV7Es5BeVE105Ys_XIccFr-269UeR4nxyKzo/export/pdf"
    },
    {
      "Branch Name": "Power\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/18qMA0Dkf4qG3IbZeqKjQqQvqCjwLAczI/export/pdf"
    },
    {
      "Branch Name": "Production\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1Prd-US6GFvcmgF51jRpI-SXuTmy3Dz4e/export/pdf"
    },
    {
      "Branch Name": "Robotics\nEngineering",
      "PPT Link": "https://docs.google.com/presentation/d/1CtonHILak6FiOsAvgmm68Jw8N_oR-xfh/export/pdf"
    },
    ];
List<String> stringfinal = new List();
List<String> pptlinks = new List();
enum _BgProps{color1,color2}
class BranchName extends StatefulWidget{
  @override
  _BranchNameState createState() => _BranchNameState();
}

class _BranchNameState extends State<BranchName> {
  TextEditingController controller = new TextEditingController();
  ScrollController _controller;
  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();
  @override
  void initState(){
    stringfinal.clear();
    pptlinks.clear();
    string.clear();
    for(int i=0;i<branchdata.length;i++)
      {
        print(branchdata[i]['PPT Link'].toString());
        string.add(branchdata[i]['Branch Name'].toString());
        pptlinks.add(branchdata[i]['PPT Link'].toString());
        stringfinal.add(branchdata[i]['Branch Name'].toString());
      }
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
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: AutoCompleteTextField<String>(
                          key: key,
                          controller: controller,
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
                            hintText: 'Search Branch Name',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
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
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewer1(pptlinks[index-1])));},
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.deepOrange,Colors.orangeAccent],
                                )
                            ),
                            child:Center(child: Text(string[index-1],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white,decoration: TextDecoration.none),),)
                        ),
                      )
                  );
                else
                  return Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewer1(pptlinks[index-1])));
                          },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.purple,Colors.pinkAccent],
                                )
                            ),
                            child:Center(child: Text(string[index-1],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white,decoration: TextDecoration.none),),)
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