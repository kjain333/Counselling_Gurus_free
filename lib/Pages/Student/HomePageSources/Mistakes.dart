import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipedetector/swipedetector.dart';
import '../../../Resources/Colors.dart' as color;
var colors = [color.orange5,color.pink9];
var dataString = [["Getting overconfident and relaxed after scoring good in JEE Main-1.",
"Getting laid back and hopeless if the result in JEE Main-1 wasn't so good.",
"Focusing completely on JEE Advanced and forgetting about JEE Main-2 after Main-1.",
"Focusing completely on JEE Main-2 and forgetting about Advanced after Main-1.",
"Not applying for any other exam than JEE (such as COMEDK, WBJEE, BITSAT, VITEEE)",
"Applying for too many entrance exams.",
"Spending too much time on relatively less important topics and hence ignoring more important topics.",
"Not following a proper study schedule while preparing for entrance examinations.",
"Making a too strict/unrealistic schedule which can't be followed properly.",
"Not checking dates of various entrance examinations before applying as they may clash sometimes.",
"Not considering other entrance exams, which one has applied for, when filling exam centre preferences (for example WBJEE is conducted in West Bengal, so if there isn't sufficient time between 2 exams then choose a location which is suitable for both exams)."
],[
"Not registering for any counselling other than JoSAA.",
"Not following state counsellings and missing the dates to apply for them.",
"Not researching or doing ground-work on the colleges/branches you are considering - research about everything like campus environment, location, facilities, placement stats, alumni network etc.",
"Researching only core branches during choice filling and ignoring any other branch.",
"Not checking past years' opening and closing ranks.",
"Choosing strictly based on past years' opening and closing ranks, instead go for a wider range of ranks around your own rank.",
"Totally preferring branch over college or college over branch - Both of them matter, a good branch in a not so good college is worth it so, keep a balance between branch and college.",
"Being too crazy about brand value - Many NITs are better than some IITs so don't ignore NITs/GFTIs just because you're getting admission in IIT, it has to be a good IIT.",
"Sacrificing a branch even if you're really interested in it - really interested means you should have proper knowledge of the branch and should not have just heard rumors about how good that branch is.",
"Choosing a branch which doesn't suit you - check the course curriculum of whatever branch you're opting, if you really don't like biology at all or hate biology then choosing biotechnology won't do you any good.",
],[
"IIT Patna is not bad just because it is in Bihar and biotechnology students don't study just biology.",
"Considering location as a major factor while choosing a college - location can be a factor but it shouldn't be a major factor, in the end a good college matters no matter how far away or where it is situated.",
"Choosing a branch/college just because of peer pressure - don't go for any branch or college just because your friends/cousins study there or because your uncle/aunty/parents suggested it because that choice will always stay with you so, do proper research and choose what's best for you.",
"Getting crazy about a particular branch - everyone is going for CS doesn't mean you have to go for it too or lose hope if you're not getting CS. Mechanical in a good IIT/NIT is much better than CS in a private college.",
"Ignoring dual degree programs completely while choice filling.",
"Relying too much on branch change - branch change is possible but it's not very easy. Don't take a risk just because you think you will change your branch.",
],[
"Taking college rankings too seriously.",
"Believing rumors about a particular college or branch - don't judge a particular branch or college just because you've heard something about it, do proper research about everything and rely on facts instead of rumors.",
"Prioritizing choices which you'll get easily during choice filling - instead fill the choices which you have a less chance of getting on the top by keeping a margin of a couple hundred ranks around your ranks.",
"Not filling choices in order of your preference.",
"Not choosing a college considering your future plans - if you want to pursue CAT, UPSC etc then choose a college where good coaching classes are easily accessible however do not choose solely based on this factor.",
"Filling just a few choices - fill as many choices as you can, there is no limit. The more you fill the more your chances of getting a good college are."
],[
  "Don't go for anything your uncle or cousin says. Consult someone who is an expert in this field and is familiar with the current system. Your uncle may have done his B.Tech from IIT 10 years ago but that doesn't mean he is familiar with the current system.",
  "Asking a first yearite about their college and branch - first yearites don't have too much knowledge about anything, most of what they know are rumors and their own opinions rather than facts. Contact 2nd/3rd yearites or people who have recently graduated or is about to graduate, they'll give you much better and legitimate information.",
  "Falling prey to blogs/articles on quora and other websites by people who are unqualified to properly access the topic",
"Go for more opinions, contact as many people as possible who are well qualified to answer your queries.",
"Relying totally on other people and not doing your own research - while asking people for advice is good, you should also do your own research. It'll help you to get more clearance and ask more queries.",
"Not following the respective counselling regularly for updates.",
"Missing or ignoring mock counselling rounds.",
"Missing important dates of counselling.",
"Locking choices without being sure or without doing proper research about them.",
"Not rearranging choices after filling them once - keep on rearranging choices as you get more and more insights.",
"Not utilizing the time given during counselling and being in a hurry - utilize all the time, till the last moment and hurrying won't get you anywhere.",
"Not saving changes during choice filling."
],[
"Avoid any last minute rush as it may result in you forgetting some important things.",
"Forgetting some document(s) when attending physical counselling.",
"Not keeping all the required documents updated.",
"Not arranging documents in the prescribed format.",
"Issuing authority of certificates not being proper or as prescribed by the respective counselling - sometimes the certificates for example - caste certificate can also be issued by 'naib tehsildar' in some regions but the counselling may ask for the signature of 'tehsildar' or an authority above it.",
"Bringing wrong/unnecessary documents for physical counselling in place of necessary ones.",
"Not keeping sufficient amounts of copies of each document - keep at least one or two copies more than what is asked for each document.",
"Not keeping documents properly arranged and managed - mismanagement of documents may lead to some documents going missing and last minute rushes."
],[
"Getting confused between FLOAT, SLIDE and FREEZE option during counselling - research about everything and don't get confused at all. Clear everything related to counselling well before appearing for it.",
"Freezing a branch by mistake.",
"Choosing the slide option by mistake - this is the worst mistake you can do as you won't get any chance again and will be ruled out of the entire counselling process.",
"Going to the wrong college for document verification in physical counselling - if you are allotted an IIT then you have to go to an IIT for document verification not in an NIT and vice versa.",
"Getting confused in when to go.for double verification - you have to go for double verification in physical counselling only when your college shifts from NIT/GFTI to IIT or vice versa i.e. if you chose float on an IIT in a certain round and you got NIT/GFTI in the subsequent round or vice versa only then you have to go for double document verification.",
"Not bringing proper documents to college for admissions process - don't miss anything, take sufficient copies with you and take all the respective documents required for admission.",
"Discrepancy in documents presented at the time of counselling and admission.",
]];
var string= ["Before College admissions","During Counselling","Judgemental towards particular branch or college","College Rankings","Consulting a non expert"," Required Documents","Getting confused between options during counselling"];
class AllMistakes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("Common Mistakes",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Here are basic categories of mistakes which student commit. To proceed further please select any category from below",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w200),),
            ),
            SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: string.length,
                    itemBuilder: (context,index){
                    return Container(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 30,right: 30),
                        title: Center(
                          child: Text(string[index], style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w300)),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Mistakes(dataString[index])));
                        },
                      ),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey),top: (index==0)?BorderSide(color: Colors.grey):BorderSide(color: Colors.transparent)),

                      ),
                    );
                })
              ],
            )
          ],
        ),
      ),
    );
  }

}
class Mistakes extends StatefulWidget{
  Mistakes(this.a);
  List<String> a;
  _Mistakes createState() => _Mistakes(a);
}
class _Mistakes extends State<Mistakes>{
  _Mistakes(this.a);
  List<String> a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text("Here are some common mistakes committed by students. Make sure you are not one of them",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Mylist(index,context);
            }, childCount: a.length),
          )
        ],
      ),
    );
  }
  Widget Mylist(int index,BuildContext context){
    if(index%2==0)
    {
      return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: <Widget>[
            Container(
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ),
            ClipPath(
              clipper: CustomClipperPath(),
              child: Container(
                  width: 300.0,
                  color: colors[0],
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
              ),
            ),
            Container(
                width: 300.0,
                child: GestureDetector(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  onTap: (){
                    setState(() {
                      return null;
                    });
                  },

                )
            )
          ],
        ),
      );
    }
    else{
      return Padding(
        padding: EdgeInsets.only(bottom: 20,left: MediaQuery.of(context).size.width-300.0),
        child: Stack(
          children: <Widget>[
            Container(
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ),
            ClipPath(
              clipper: CustomClipperPath1(),
              child: Container(
                  width: 300.0,
                  color: colors[1],
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
              ),
            ),
            Container(
                width: 300.0,
                child: GestureDetector(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  onTap: (){
                    setState(() {
                      return null;
                    });
                  },

                )
            )
          ],
        ),
      );
    }
  }
}

class CustomClipperPath extends CustomClipper<Path>{

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0,0.0);
    path.lineTo(size.width-20, 0.0);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width-20, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
}
class CustomClipperPath1 extends CustomClipper<Path>{

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width,0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(20.0, size.height);
    path.lineTo(0.0, size.height/2);
    path.lineTo(20.0, 0.0);
    path.close();
    return path;
  }
}
