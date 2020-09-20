import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../PdfViewer.dart';
var title = ["PHYSICS for IIT-JEE","MATHS for IIT-JEE","CHEMISTRY for IIT-JEE"];
var subt = ["electromagnetism,optics,mechanics,kinematics and much more.","Trigonometry,Calculus,Probability,Determinants and Matrices and much more.","Stoichiometry,Reaction Kinematics,Organic Chemistry,Periodic Analysis and much more"];
var heading = ["Physics","Maths","Chemistry"];
var chapters = [
  [
    "Alternating Currents",
    "Atomic Structure",
    "Capacitors and Condensor",
    "Conductors",
    "Current Electricity",
    "Diffraction",
    "Electromagnetic wave",
    "Electrostatic",
    "Gravitation",
    "Metrology and Error Analysis",
    "Modern Physics",
    "Nuclear Physics",
    "Polarization",
    "Radioactivity",
    "Ray Optics",
    "Semi-Conductors",
    "Simple Harmonic Motion",
    "Wave Optics",
    "X-Ray"
  ],
  [
    "3-D Vectors and Motion",
    "Application of Derivatives",
    "Area under the curve",
    "Basic Maths",
    "Continuity",
    "Circles",
    "Complex Numbers",
    "Definite Integration",
    "Determinant",
    "Differentiability",
    "Ellipse and Hyperbola",
    "Indefinite Integrals",
    "Inverse Trigonometry Function",
    "Limits",
    "Linear Programming",
    "Mathematical Reasoning",
    "Matrices",
    "Maxima-Minima",
    "Method of Differentiation",
    "Permutation and Combination",
    "Conic Sections",
    "Probability",
    "Statistics",
    "Straight Line",
    "Vector",
  ],
  [
    "Chemical Reactions",
    "Carboxylic acid and derivatives",
    "Carboanion",
    "Chemical Bonding",
    "Chemical Equilibrium",
    "Chemical Kinetics",
    "Coordinate Chemistry",
    "d-Block",
    "Electrochemistry",
    "Elimination reaction",
    "General Organic Chemistry",
    "Halogen Derivative",
    "Hydrocarbon",
    "Ionic Equilibrium",
    "Isomerism",
    "Solutions",
    "Metallurgy",
    "Mole Concept",
    "Optical Isomerism",
    "Aldehyde and Ketone",
    "Radioactivity",
    "Redox Reaction",
    "Reduction",
    "Salt Analysis",
    "s-Block",
    "Solid State",
    "Surface Chemistry",
    "Test of Anions",
    "Thermochemical reactions",
    "Thermochemistry",
    "Thermodynamics-1",
    "Thermodynamics-2"
  ]
];
class NotesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text('Put the Concepts Right With',style: GoogleFonts.aBeeZee(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Text('Quick Revision Notes',style: GoogleFonts.aBeeZee(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.blue),),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.width-60,
              width: MediaQuery.of(context).size.width-60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Notes.png')
                )
              ),
            ),
            GestureDetector(
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(title[0],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),),
                subtitle: Text(subt[0],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 15),),
                trailing: Icon(Icons.arrow_forward),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectNote(0)));
              },
            ),
            GestureDetector(
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(title[1],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),),
                subtitle: Text(subt[1],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 15),),
                trailing: Icon(Icons.arrow_forward),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectNote(1)));
              },
            ),
            GestureDetector(
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(title[2],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),),
                subtitle: Text(subt[2],style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100,fontSize: 15),),
                trailing: Icon(Icons.arrow_forward),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectNote(2)));
              },
            ),
          ],
        ),
      ),
    );
  }

}
var sub = ["Physics","Maths","Chemistry"];
class SubjectNote extends StatelessWidget{
  SubjectNote(this.subject);
  final int subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(sub[subject],style: GoogleFonts.aBeeZee(fontSize: 22,fontWeight: FontWeight.bold),),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                 //   padding: EdgeInsets.all(20),
                    itemCount: chapters[subject].length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Material(
                          elevation: 20,
                          child: Container(
                              width: MediaQuery.of(context).size.width-40,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20,right:20,top: 10,bottom: 10),
                                child: GestureDetector(
                                  child: ListTile(
                                    leading: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                        child: Center(
                                          child: Icon(Icons.grade,color: Colors.amber,size: 15,),
                                        )
                                    ),
                                    title: Text(chapters[subject][index],style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w300),),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  ),
                                  onTap: (){
                                    return null;
                                  },
                                )
                              ),
                          ),
                        ),
                      );
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}