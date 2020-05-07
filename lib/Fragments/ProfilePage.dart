import 'package:counselling_gurus/Pages/Student/CompleteNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 380,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.deepOrangeAccent,
                          Colors.orange,
                          Colors.orangeAccent,
                        ],
                        stops: [0.2,0.7,1],
                      )
                  ),
                ),
                Positioned(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.2,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3.5,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height / 7,
                  left: MediaQuery
                      .of(context)
                      .size
                      .width / 11,
                  child: Material(
                    elevation: 30,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        ListTile(
                          title:Center(
                            child: Text('NAME',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
                             ),
                           subtitle: Center(
                             child: Text('City,State',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                           ),

                        ),
                        ListTile(
                          title: Text('This is where we can put a few lines of bio which user will input.',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                          contentPadding: EdgeInsets.only(left: 50,right: 50),

                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  height: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height / 15,
                  left: MediaQuery
                      .of(context)
                      .size
                      .width / 3 ,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/splashpic.png')),
                    ),
                  ),
                )
              ],
            ),
          ),
          Material(
            child: ListTile(
              leading: Icon(Icons.email,color: Colors.black,),
              title: Text('mynameis@gmail.com',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),),
            ),
            elevation: 10,
          ),
          Material(
            child: ListTile(
              leading: Icon(Icons.phone_android,color: Colors.black,),
              title: Text('9876543210',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 15),),
            ),
            elevation: 10,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            child: Stack(
              children: <Widget>[

                Positioned(
                  left: 80,
                  top: 20,
                  child: Container(
                    height: 80,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent,Colors.greenAccent]
                      )
                    ),
                    child: SizedBox(
                      child: Center(child: Text('MENTOR NAME\nCollege Name\nQualification',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.yellowAccent) ),
                    )),
                  ),
                ),
                Positioned(
                  left: 20,
                  child:  Container(

                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/splashpic.png'),
                          fit: BoxFit.fill,
                        )
                    ),
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}/*Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange,Colors.white],
            )
          ),
          ),
          clipper: GetClipper(),
        ),
        Positioned(
            width: MediaQuery.of(context).size.width / 1,
            top: MediaQuery.of(context).size.height / 16,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.red,Colors.orange,Colors.orangeAccent,Colors.yellowAccent],
                        ),
                        image: DecorationImage(
                            image:
                                new AssetImage('assets/images/splashpic.png')),
                        /*image: DecorationImage(
                            image: NetworkImage(
                                'Any .jpg file URL'),
                            fit: BoxFit.cover),
                        */
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                       )),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'VarSVat',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(icon: Icon(Icons.edit), onPressed: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'I Am A Student ',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(width: 40),
                    IconButton(icon: Icon(Icons.edit), onPressed: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'IIT-JEE Stream',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(width: 40),
                    IconButton(icon: Icon(Icons.edit), onPressed: () {})
                  ],
                ),
                Card(
                    color: Colors.white,
                    borderOnForeground: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '123456XXXX',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    )),
                Card(
                    color: Colors.white,
                    borderOnForeground: true,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Gender',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    )),
                Card(
                    color: Colors.white,
                    borderOnForeground: true,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.mail,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'varun@xyz.com',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    )),
                SizedBox(height: 20.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red[800],
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Log out',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 50, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

//Trying Push
*/